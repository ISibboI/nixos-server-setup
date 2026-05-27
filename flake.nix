{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    radd.url = "github:ISibboI/radd";
    radd.inputs.nixpkgs.url = "github:NixOS/nixpkgs/b71c3965ae02e6788567965c91976020509a0710";
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