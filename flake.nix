{
  inputs = {
    nixpkgs = {
      # url = "github:nixos/nixpkgs/nixos-24.05";
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      # url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixosModules = ./modules/nixos;
    in
    {
      nixosConfigurations = {
        default =
          let
            configuration = ./configuration.nix;
            hardware-configuration = ./hardware-configuration/desktop.nix;
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
            };
            modules = [
              home-manager.nixosModules.default
              hardware-configuration
              configuration
              nixosModules
            ];
          };
        desktop =
          let
            configuration = ./hosts/desktop/configuration.nix;
            hardware-configuration = ./hosts/desktop/hardware-configuration.nix;
          in
          nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit inputs;
            };
            modules = [
              home-manager.nixosModules.default
              configuration
              hardware-configuration
            ];
          };
      };

      devShells."${system}" =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = import ./shells/default.nix {
            inherit pkgs;
          };
          ttslabs = import ./shells/ttslabs.nix {
            inherit pkgs;
          };
          work = import ./shells/work.nix {
            inherit pkgs;
          };
        };
    };

}
