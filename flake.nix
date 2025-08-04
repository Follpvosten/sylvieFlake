{
  description = "yvlsie confing";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, nur, disko, ... }: {
    nixosConfigurations.tzuyu = nixpkgs.lib.nixosSystem {
      modules = [
        ./nixos/configuration.nix

        nur.modules.nixos.default
        disko.nixosModules.disko
        nixos-hardware.nixosModules.chuwi-minibook-x
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.sylvie = import home-manager/sylvie.nix;
        }
      ];
    };
  };
}
