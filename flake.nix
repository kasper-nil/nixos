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
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            nixosModules
            home-manager.nixosModules.home-manager
            {
              extraSpecialArgs = {
                inherit inputs;
              };
              users = {
                kasper = import ./hosts/desktop/home.nix;
              };
              backupFileExtension = "backup";
            }
            ./hosts/desktop/configuration.nix
            ./hosts/desktop/hardware-configuration.nix
          ];
        };
        work = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./hosts/desktop/configuration.nix
            ./hosts/desktop/hardware-configuration.nix
            home-manager.nixosModules.default
            nixosModules
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
