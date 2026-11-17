{
  inputs = {
    # Each server tracks its own nixpkgs, so they can be updated independently:
    #   nix flake update nixpkgs-hetzner
    #   nix flake update nixpkgs-local
    nixpkgs-hetzner.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-local.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Pinned for fish 4.8.1: fish 4.9.3 crashes with SIGILL on the local server's
    # Athlon II CPU (no SSE4.1) whenever it saves history. Remove once fixed.
    nixpkgs-fish.url = "github:NixOS/nixpkgs/61b7c44c4073f0b827768aff0049561b5110ea5a";
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
