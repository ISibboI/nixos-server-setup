#!/usr/bin/env bash

# Usage: local/setup.sh

set -eu
set -o pipefail

set -x

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

# Installing nix

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

cd /mnt/etc/nixos

# https://stackoverflow.com/questions/2411031/how-do-i-clone-into-a-non-empty-directory
git init
git remote add origin https://github.com/isibboi/nixos-server-setup.git
git fetch
git reset origin/main  # Required when the versioned files existed in path before "git init" of this repo.
git checkout -t origin/main
git checkout .

# Symlink local nixos configuration.
ln -sr /mnt/etc/nixos/local/configuration.nix /mnt/etc/nixos/

# Install NixOS
PATH="$PATH" `which nixos-install` --no-root-passwd --root /mnt --max-jobs 40

umount /mnt

reboot