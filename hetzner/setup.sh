#!/usr/bin/env bash

# Installs NixOS on a Hetzner server, wiping the server.
#
# This is for a specific server configuration; adjust where needed.
#
# Usage:
#     ssh root@YOUR_SERVERS_IP bash -s < hetzner/setup.sh
#
# When the script is done, make sure to boot the server from HD, not rescue mode again.

# Explanations:
#
# * Adapted from https://github.com/nix-community/nixos-install-scripts/blob/master/hosters/hetzner-dedicated/hetzner-dedicated-wipe-and-install-nixos.sh
# * Following largely https://nixos.org/nixos/manual/index.html#sec-installing-from-other-distro.
# * **Important:** We boot in legacy-BIOS mode, not UEFI, because that's what Hetzner uses.
#   * NVMe devices aren't supported for booting (those require EFI boot)
# * We set a custom `configuration.nix` so that we can connect to the machine afterwards,
#   inspired by https://nixos.wiki/wiki/Install_NixOS_on_Hetzner_Online
# * This server has 2 HDDs.
#   We put everything on RAID1.
#   Storage scheme: `partitions -> RAID -> LVM -> ext4`.
# * A root user with empty password is created, so that you can just login
#   as root and press enter when using the Hetzner spider KVM.
#   Of course that empty-password login isn't exposed to the Internet.
#   Change the password afterwards to avoid anyone with physical access
#   being able to login without any authentication.
# * The script reboots at the end.

set -eu
set -o pipefail

set -x

# Global properties
if [[ -z "${DOMAIN:-}" ]]; then
    echo "DOMAIN is empty, aborting"
    exit 1
fi

if [[ -z "${SSH_KEY:-}" ]]; then
    AUTHORIZED_KEYS_FILE=/root/.ssh/authorized_keys
    echo "SSH_KEY is empty, checking $AUTHORIZED_KEYS_FILE if there is any"
    set +e
    SSH_KEY=$(head -n 1 $AUTHORIZED_KEYS_FILE)
    set -e

    if [[ -z "${SSH_KEY:-}" ]]; then
        echo "Error: no SSH_KEY found in $AUTHORIZED_KEYS_FILE"
        exit 1
    else
        echo "Found at least one SSH_KEY in $AUTHORIZED_KEYS_FILE, chose the first"
    fi
fi

if [[ -z "${NIXOS_STATE_VERSION:-}" ]]; then
    echo "NIXOS_STATE_VERSION is empty, using default value \"23.05\""
    NIXOS_STATE_VERSION="23.05"
fi

if [[ -z "${NETMASK_PREFIX_LENGTH:-}" ]]; then
    echo "NETMASK_PREFIX_LENGTH is empty, using default value 26"
    NETMASK_PREFIX_LENGTH=26
fi

# Inspect existing disks
lsblk

# Undo existing setups to allow running the script multiple times to iterate on it.
# We allow these operations to fail for the case the script runs the first time.
set +e
umount /mnt
vgchange -an
set -e

# Stop all mdadm arrays that the boot may have activated.
mdadm --stop --scan

# Prevent mdadm from auto-assembling arrays.
# Otherwise, as soon as we create the partition tables below, it will try to
# re-assemple a previous RAID if any remaining RAID signatures are present,
# before we even get the chance to wipe them.
# From:
#     https://unix.stackexchange.com/questions/166688/prevent-debian-from-auto-assembling-raid-at-boot/504035#504035
# We use `>` because the file may already contain some detected RAID arrays,
# which would take precedence over our `<ignore>`.
echo 'AUTO -all
ARRAY <ignore> UUID=00000000:00000000:00000000:00000000' > /etc/mdadm/mdadm.conf

# Create wrapper for parted >= 3.3 that does not exit 1 when it cannot inform
# the kernel of partitions changing (we use partprobe for that).
echo -e "#! /usr/bin/env bash\nset -e\n" 'parted $@ 2> parted-stderr.txt || grep "unable to inform the kernel of the change" parted-stderr.txt && echo "This is expected, continuing" || (echo >&2 "Parted failed; stderr: $(< parted-stderr.txt)"; exit 1)' > parted-ignoring-partprobe-error.sh && chmod +x parted-ignoring-partprobe-error.sh

# Create partition tables (--script to not ask)
./parted-ignoring-partprobe-error.sh --script /dev/sda mklabel gpt
./parted-ignoring-partprobe-error.sh --script /dev/sdb mklabel gpt

# Create partitions (--script to not ask)
#
# We create the 1MB BIOS boot partition at the front.
#
# Note we use "MB" instead of "MiB" because otherwise `--align optimal` has no effect;
# as per documentation https://www.gnu.org/software/parted/manual/html_node/unit.html#unit:
# > Note that as of parted-2.4, when you specify start and/or end values using IEC
# > binary units like "MiB", "GiB", "TiB", etc., parted treats those values as exact
#
# Note: When using `mkpart` on GPT, as per
#   https://www.gnu.org/software/parted/manual/html_node/mkpart.html#mkpart
# the first argument to `mkpart` is not a `part-type`, but the GPT partition name:
#   ... part-type is one of 'primary', 'extended' or 'logical', and may be specified only with 'msdos' or 'dvh' partition tables.
#   A name must be specified for a 'gpt' partition table.
# GPT partition names are limited to 36 UTF-16 chars, see https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_entries_(LBA_2-33).
./parted-ignoring-partprobe-error.sh --script --align optimal /dev/sda -- mklabel gpt mkpart 'BIOS-boot-partition' 1MB 2MB set 1 bios_grub on mkpart 'data-partition' 2MB '-16GB' mkpart 'swap' linux-swap '-16GB' '100%'
./parted-ignoring-partprobe-error.sh --script --align optimal /dev/sdb -- mklabel gpt mkpart 'BIOS-boot-partition' 1MB 2MB set 1 bios_grub on mkpart 'data-partition' 2MB '-16GB' mkpart 'swap' linux-swap '-16GB' '100%'

# Reload partitions
partprobe

# Wait for all devices to exist
udevadm settle --timeout=5 --exit-if-exists=/dev/sda1
udevadm settle --timeout=5 --exit-if-exists=/dev/sda2
udevadm settle --timeout=5 --exit-if-exists=/dev/sda3
udevadm settle --timeout=5 --exit-if-exists=/dev/sdb1
udevadm settle --timeout=5 --exit-if-exists=/dev/sdb2
udevadm settle --timeout=5 --exit-if-exists=/dev/sdb3

# Wipe any previous RAID signatures
mdadm --zero-superblock --force /dev/sda2
mdadm --zero-superblock --force /dev/sdb2

# Create RAIDs
# Note that during creating and boot-time assembly, mdadm cares about the
# host name, and the existence and contents of `mdadm.conf`!
# This also affects the names appearing in /dev/md/ being different
# before and after reboot in general (but we take extra care here
# to pass explicit names, and set HOMEHOST for the rebooting system further
# down, so that the names appear the same).
# Almost all details of this are explained in
#   https://bugzilla.redhat.com/show_bug.cgi?id=606481#c14
# and the followup comments by Doug Ledford.
mdadm --create --run --verbose /dev/md0 --level=1 --raid-devices=2 --homehost=hetzner --name=root0 /dev/sda2 /dev/sdb2

# Assembling the RAID can result in auto-activation of previously-existing LVM
# groups, preventing the RAID block device wiping below with
# `Device or resource busy`. So disable all VGs first.
vgchange -an

# Wipe filesystem signatures that might be on the RAID from some
# possibly existing older use of the disks (RAID creation does not do that).
# See https://serverfault.com/questions/911370/why-does-mdadm-zero-superblock-preserve-file-system-information
wipefs -a /dev/md0

# Disable RAID recovery. We don't want this to slow down machine provisioning
# in the rescue mode. It can run in normal operation after reboot.
echo 0 > /proc/sys/dev/raid/speed_limit_max

# LVM
# PVs
pvcreate /dev/md0
# VGs
vgcreate vg0 /dev/md0
# LVs (--yes to automatically wipe detected file system signatures)
lvcreate --yes --extents 100%FREE -n root0 vg0

# Filesystems (-f to not ask on preexisting FS)
mkfs.btrfs -f -L root /dev/mapper/vg0-root0
mkswap -L swapa /dev/sda3
mkswap -L swapb /dev/sdb3

# Creating file systems changes their UUIDs.
# Trigger udev so that the entries in /dev/disk/by-uuid get refreshed.
# `nixos-generate-config` depends on those being up-to-date.
# See https://github.com/NixOS/nixpkgs/issues/62444
udevadm trigger

# Wait for FS labels to appear
udevadm settle --timeout=5 --exit-if-exists=/dev/disk/by-label/root

# NixOS pre-installation mounts

# Mount target root partition
mount /dev/disk/by-label/root /mnt

# Installing nix

# Installing nix requires `sudo`; the Hetzner rescue mode doesn't have it.
apt-get install -y sudo

# Allow installing nix as root, see
#   https://github.com/NixOS/nix/issues/936#issuecomment-475795730
mkdir -p /etc/nix
echo "build-users-group =" > /etc/nix/nix.conf

curl -L https://nixos.org/nix/install | sh
set +u +x # sourcing this may refer to unset variables that we have no control over
. $HOME/.nix-profile/etc/profile.d/nix.sh
set -u -x

nix-channel --add https://nixos.org/channels/nixos-$NIXOS_STATE_VERSION nixpkgs
nix-channel --update

# Getting NixOS installation tools
nix-env -iE "_: with import <nixpkgs/nixos> { configuration = { programs.git.enable = true; }; }; with config.system.build; [ nixos-generate-config nixos-install nixos-enter manual.manpages ]"

nixos-generate-config --root /mnt

# Find the name of the network interface that connects us to the Internet.
# Inspired by https://unix.stackexchange.com/questions/14961/how-to-find-out-which-interface-am-i-using-for-connecting-to-the-internet/302613#302613
RESCUE_INTERFACE=$(ip route get 9.9.9.9 | grep -Po '(?<=dev )(\S+)')

# Find what its name will be under NixOS, which uses stable interface names.
# See https://major.io/2015/08/21/understanding-systemds-predictable-network-device-names/#comment-545626
# NICs for most Hetzner servers are not onboard, which is why we use
# `ID_NET_NAME_PATH`otherwise it would be `ID_NET_NAME_ONBOARD`.
INTERFACE_DEVICE_PATH=$(udevadm info -e | grep -Po "(?<=^P: )(.*${RESCUE_INTERFACE})")
UDEVADM_PROPERTIES_FOR_INTERFACE=$(udevadm info --query=property "--path=$INTERFACE_DEVICE_PATH")
NIXOS_INTERFACE=$(echo "$UDEVADM_PROPERTIES_FOR_INTERFACE" | grep -o -E 'ID_NET_NAME_PATH=\w+' | cut -d= -f2)
echo "Determined NIXOS_INTERFACE as '$NIXOS_INTERFACE'"

IP_V4=$(ip route get 9.9.9.9 | grep -Po '(?<=src )(\S+)')
echo "Determined IP_V4 as $IP_V4"

# Determine Internet IPv6 by checking route, and using ::1
# (because Hetzner rescue mode uses ::2 by default).
# The `ip -6 route get` output on Hetzner looks like:
#   # ip -6 route get 2001:4860:4860:0:0:0:0:8888
#   2001:4860:4860::8888 via fe80::1 dev eth0 src 2a01:4f8:151:62aa::2 metric 1024  pref medium
IP_V6="$(ip route get 2001:4860:4860:0:0:0:0:8888 | head -1 | cut -d' ' -f7 | cut -d: -f1-4)::1"
echo "Determined IP_V6 as $IP_V6"


# From https://stackoverflow.com/questions/1204629/how-do-i-get-the-default-gateway-in-linux-given-the-destination/15973156#15973156
read _ _ DEFAULT_GATEWAY _ < <(ip route list match 0/0); echo "$DEFAULT_GATEWAY"
echo "Determined DEFAULT_GATEWAY as $DEFAULT_GATEWAY"

cd /mnt/etc/nixos

# https://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory
git init
git remote add origin https://github.com/isibboi/nixos-server-setup.git
git fetch
git reset origin/main  # Required when the versioned files existed in path before "git init" of this repo.
git checkout -t origin/main
git checkout .

# Now we have a `configuration.nix` that is just missing some secrets.
# Generate `secrets.nix`. Note that we splice in shell variables.
cat > /mnt/etc/nixos/hetzner/secrets.nix <<EOF
{ config, pkgs, ... }:

{
  # Network (Hetzner uses static IP assignments, and we don't use DHCP here)
  networking.useDHCP = false;
  networking.domain = "$DOMAIN";
  networking.interfaces."$NIXOS_INTERFACE".ipv4.addresses = [
    {
      address = "$IP_V4";
      # The prefix length is commonly, but not always, 24.
      # You should check what the prefix length is for your server
      # by inspecting the netmask in the "IPs" tab of the Hetzner UI.
      # For example, a netmask of 255.255.255.0 means prefix length 24
      # (24 leading 1s), and 255.255.255.192 means prefix length 26
      # (26 leading 1s).
      prefixLength = $NETMASK_PREFIX_LENGTH;
    }
  ];
  networking.interfaces."$NIXOS_INTERFACE".ipv6.addresses = [
    {
      address = "$IP_V6";
      prefixLength = 64;
    }
  ];
  networking.defaultGateway = "$DEFAULT_GATEWAY";
  networking.defaultGateway6 = { address = "fe80::1"; interface = "$NIXOS_INTERFACE"; };

  # The only possibility to log in initially is this ssh key.
  users.users.root.openssh.authorizedKeys.keys = [
    "$SSH_KEY"
  ];
  
  # The following is technically not a secret, but it is set by the install script,
  # so we put it here such that we can keep the plain \`configuration.nix\` as in the
  # git repo.
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "$NIXOS_STATE_VERSION"; # Did you read the comment?
}
EOF

# Symlink hetzner nixos configuration.
ln -sr /mnt/etc/nixos/hetzner/configuration.nix /mnt/etc/nixos/

# Install NixOS
PATH="$PATH" `which nixos-install` --no-root-passwd --root /mnt --max-jobs 40

umount /mnt

reboot