{
  inputs = {
    # Each server tracks its own nixpkgs, so they can be updated independently:
    #   nix flake update nixpkgs-hetzner
    #   nix flake update nixpkgs-local
    nixpkgs-hetzner.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-local.url = "github:NixOS/nixpkgs/nixos-unstable";
    radd.url = "github:ISibboI/radd";
    # Newer nixpkgs cmake does not work on x86-64 anymore...
    radd.inputs.nixpkgs.url = "github:NixOS/nixpkgs/b71c3965ae02e6788567965c91976020509a0710";
  };
  outputs = { self, nixpkgs-hetzner, nixpkgs-local, ... }@attrs: {
    nixosConfigurations.hetzner = nixpkgs-hetzner.lib.nixosSystem {
      modules = [ ./hetzner/configuration.nix ];
    };

    nixosConfigurations.local = nixpkgs-local.lib.nixosSystem {
      specialArgs = attrs;
      modules = [ ./local/configuration.nix ];
    };
  };
}
