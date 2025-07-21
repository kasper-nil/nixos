{
  inputs = {
    nixpkgs = {
      # url = "github:nixos/nixpkgs/nixos-24.05";
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      # url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox = {
      # url = "github:nix-community/flake-firefox-nightly?rev=0addf9b5249f6183f3193aff337cd3961b4cf57d";
      url = "github:nix-community/flake-firefox-nightly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/desktop/configuration.nix ];
        };

        work = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/work/configuration.nix ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/laptop/configuration.nix ];
        };

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

      devShells."${system}" =
        let
          pkgs = import nixpkgs { inherit system; };

        in
        {
          ttslabs = import ./shells/ttslabs.nix { inherit pkgs; };
          ttslabs-prod = import ./shells/ttslabs-prod.nix { inherit pkgs; };
          work = import ./shells/work.nix { inherit pkgs; };
          cs2 = import ./shells/cs2.nix { inherit pkgs; };
          react-native = import ./shells/react-native.nix { inherit pkgs; };
        };
    };

}
