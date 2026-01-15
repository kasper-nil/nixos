{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
      #url = "github:nixos/nixpkgs/pull/476347/head";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nilhub = {
      #url = "github:kasper-nil/nilhub";
      url = "path:/home/kasper/Documents/Projects/nilhub/";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      mkSystem =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/${hostname}/configuration.nix ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkSystem "desktop";
        work = mkSystem "work";
        laptop = mkSystem "laptop";

        # Server with custom config
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            extraInstallerPackages = pkgs: [
              pkgs.dosfstools
              pkgs.mtools
            ];
          };
          modules = [ ./hosts/server/configuration.nix ];
        };
      };

      devShells.${system} = {
        tauri = import ./shells/tauri.nix;
        tts = import ./shells/tts.nix;
      };
    };
}
