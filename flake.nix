{
  inputs = {
    nixpkgs = {
      # url = "github:NixOS/nixpkgs/nixos-unstable";
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };

    home-manager = {
      # url = "github:nix-community/home-manager/master";
      # url = "github:nix-community/home-manager/release-25.11";
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nilhub = {
      # url = "github:kasper-nil/nilhub";
      url = "path:/home/kasper/Documents/Projects/nilhub/";
      inputs.nixpkgs.follows = "nixpkgs";
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

      devShells.${system} =
        let
          pkgs = import nixpkgs {
            inherit system;
            config.permittedInsecurePackages = [ "openssl-1.1.1w" ];
          };
        in
        {
          tauri = import ./shells/tauri.nix { inherit pkgs; };
          tts = import ./shells/tts.nix { inherit pkgs; };
        };
    };
}
