{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixhub = {
      url = "github:kasper-nil/nixhub";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
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

      # devShells.x86_64-linux =
      #   let
      #     pkgs = import nixpkgs { system = "x86_64-linux"; };
      #   in
      #   {
      #     ttslabs = import ./shells/ttslabs.nix { inherit pkgs; };
      #     ttslabs-prod = import ./shells/ttslabs-prod.nix { inherit pkgs; };
      #     work = import ./shells/work.nix { inherit pkgs; };
      #     cs2 = import ./shells/cs2.nix { inherit pkgs; };
      #     react-native = import ./shells/react-native.nix { inherit pkgs; };
      #   };
    };
}
