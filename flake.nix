{
  inputs = {
    # Each server tracks its own nixpkgs, so they can be updated independently:
    #   nix flake update nixpkgs-hetzner
    #   nix flake update nixpkgs-local
    nixpkgs-hetzner.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-local.url = "github:NixOS/nixpkgs/nixos-unstable";
    radd.url = "github:ISibboI/radd";
    radd.inputs.nixpkgs.follows = "nixpkgs-local";
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
