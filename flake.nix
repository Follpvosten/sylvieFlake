{
  description = "yvlsie confing";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, home-manager, nur, ... }@inputs: {
    nixosConfigurations = {
      tzuyu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix

          nur.modules.nixos.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = !false;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.backupFileExtension = "bak";
            home-manager.sharedModules = [ nur.modules.homeManager.default ];
            home-manager.users.sylvie = import home-manager/sylvie.nix;
          }
        ];
      };
    };
  };
}
