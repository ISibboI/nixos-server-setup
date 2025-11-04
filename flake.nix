{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    radd.url = "github:ISibboI/radd";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.hetzner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hetzner/configuration.nix ];
    };

    nixosConfigurations.local = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./local/configuration.nix ];
    };
  };
}