#!/usr/bin/env bash

# Creates a NixOS installation medium for the local server.

set -eu
set -o pipefail

set -x

# Find local ssh key.
if [[ -z "${SSH_KEY:-}" ]]; then
    set +o pipefail
    set +e
    PUBKEY_FILE=$(ls ~/.ssh/id_*.pub | head -n 1)
    set -e
    set -o pipefail

    if [[ -z "${PUBKEY_FILE:-}" ]]; then
        echo "SSH_KEY is empty and there is no suitable pubkey in ~/.ssh"
        exit 1
    else
        echo "SSH_KEY is empty, using $PUBKEY_FILE"
        SSH_KEY=$(cat $PUBKEY_FILE)
    fi
fi

# Check if nix is installed, and install if not.
if [ `which nix` ]; then
    echo "Found an existing nix installation"
    INSTALL_NIX=0
else
    echo "No nix installation found. Installing nix for the purpose of creating the iso, and uninstalling it later."
    INSTALL_NIX=1

    sh <(curl -L https://nixos.org/nix/install) --no-daemon
    source ~/.profile

    if [ `which nix` ]; then
        echo "Nix installed successfully."
    else
        echo "Nix was installed, but the path was not set up correctly."
        exit 1
    fi
fi

# Generate `iso.nix`. Note that we splice in shell variables.
cat > iso.nix <<EOF
{ config, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>

    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  # Network
  networking.useDHCP = true;

  # The only possibility to log in initially is this ssh key.
  users.users.root.openssh.authorizedKeys.keys = [
    "$SSH_KEY"
  ];

  # Make building the iso faster, but make it a bit larger as well.
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
}
EOF

# Build iso.
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix
cp -l result/iso/*.iso .

# Cleanup
rm iso.nix
rm -f result

# Uninstall nix if it was installed by this script.
if [ $INSTALL_NIX ]; then
    echo "Nix was installed before already, leaving it be."
else
    echo "Nix was installed for the purpose of creating the iso, uninstalling now."
    sudo rm -rf /nix ~/.nix-channels ~/.nix-defexpr ~/.nix-profile
fi