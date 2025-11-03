{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.hetzner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./hetzner/configuration.nix ];
    };

    nixosConfigurations.local = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./local/configuration.nix ];
    };
  };
}