#!/usr/bin/env bash

# Usage: ssh root@YOUR_SERVERS_IP bash -s < local/setup.sh

set -eu
set -o pipefail

set -x

# Global properties
if [[ -z "${SSH_KEY:-}" ]]; then
    AUTHORIZED_KEYS_FILE=/etc/ssh/authorized_keys.d/root
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
    echo "NIXOS_STATE_VERSION is empty, using default value \"24.05\""
    NIXOS_STATE_VERSION="24.05"
fi

# Inspect existing disks.
lsblk

# Undo existing setups to allow running the script multiple times to iterate on it.
# We allow these operations to fail for the case the script runs the first time.
set +e
umount /mnt
vgchange -an
set -e

# Create wrapper for parted >= 3.3 that does not exit 1 when it cannot inform
# the kernel of partitions changing (we use partprobe for that).
echo -e "#! /usr/bin/env bash\nset -e\n" 'parted $@ 2> parted-stderr.txt || grep "unable to inform the kernel of the change" parted-stderr.txt && echo "This is expected, continuing" || (echo >&2 "Parted failed; stderr: $(< parted-stderr.txt)"; exit 1)' > parted-ignoring-partprobe-error.sh && chmod +x parted-ignoring-partprobe-error.sh

# Create partition tables (--script to not ask)
./parted-ignoring-partprobe-error.sh --script /dev/sda mklabel gpt

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
./parted-ignoring-partprobe-error.sh --script --align optimal /dev/sda -- mklabel gpt mkpart 'BIOS-boot-partition' 1MB 2MB set 1 bios_grub on mkpart 'data-partition' 2MB '-2GB' mkpart 'swap' linux-swap '-2GB' '100%'

# Reload partitions
partprobe /dev/sda

# Wait for all devices to exist
udevadm settle --timeout=5 --exit-if-exists=/dev/sda1
udevadm settle --timeout=5 --exit-if-exists=/dev/sda2
udevadm settle --timeout=5 --exit-if-exists=/dev/sda3

# Filesystems (-f to not ask on preexisting FS)
mkfs.btrfs -f -L root /dev/sda2
mkswap -L swapa /dev/sda3

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

# Setting up nix channels
nix-channel --add https://nixos.org/channels/nixos-$NIXOS_STATE_VERSION nixpkgs
nix-channel --update

nixos-generate-config --root /mnt

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
cat > /mnt/etc/nixos/local/secrets.nix <<EOF
{ config, pkgs, ... }:
{
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

# Symlink local nixos configuration.
ln -sr /mnt/etc/nixos/local/configuration.nix /mnt/etc/nixos/

# Install NixOS
PATH="$PATH" `which nixos-install` --no-root-passwd --root /mnt --max-jobs 40

umount /mnt

reboot