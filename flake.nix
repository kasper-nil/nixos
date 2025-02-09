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
      sharedModules = [
        ./modules/nixos
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs;
            };
          };
        }
      ];
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = sharedModules ++ [
            {
              home-manager = {
                users = {
                  kasper = import ./hosts/desktop/home.nix;
                };
                backupFileExtension = "desktop-backup-7";
              };
            }
            ./hosts/desktop/configuration.nix
            ./hosts/desktop/hardware-configuration.nix
          ];
        };
        work = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = sharedModules ++ [
            {
              home-manager = {
                users = {
                  kasper = import ./hosts/work/home.nix;
                };
                backupFileExtension = "work-backup";
              };
            }
            ./hosts/work/configuration.nix
            ./hosts/work/hardware-configuration.nix
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
          cs2 = import ./shells/cs2.nix {
            inherit pkgs;
          };
        };
    };

}
