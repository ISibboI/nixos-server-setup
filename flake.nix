{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    radd.url = "github:ISibboI/radd";
    radd.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, ... }@attrs: {
    nixosConfigurations.hetzner = nixpkgs.lib.nixosSystem {
      modules = [ ./hetzner/configuration.nix ];
    };

    nixosConfigurations.local = nixpkgs.lib.nixosSystem {
      specialArgs = attrs;
      modules = [ ./local/configuration.nix ];
    };
  };
}