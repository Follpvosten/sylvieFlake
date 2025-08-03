{
  description = "yvlsie confing";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-hardware, home-manager, ... }: {
    nixosConfigurations = {
      godemiche = nixpkgs.lib.nixosSystem { 
        system = "x86_64-linux";
        modules = [
          ./nixos/configuration.nix

          nixos-hardware.nixosModules.common-cpu-amd-zenpower
          nixos-hardware.nixosModules.common-cpu-amd-pstate
          nixos-hardware.nixosModules.common-gpu-amd
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sylvie = import home-manager/sylvie.nix;
          }
        ];
      };
    };
  };
}
