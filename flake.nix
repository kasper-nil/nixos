{
  inputs = {
    zen-browser.url = "github:MarceColl/zen-browser-flake";

    nixpkgs = {
      # url = "github:nixos/nixpkgs/nixos-24.05";
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      # url = "github:nix-community/home-manager/release-24.05";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      plasma-manager,
      fenix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixos-configuration = ./nixos/configuration.nix;
      hardware-configuration = ./hardware-configuration.nix;
    in
    {
      packages.${system}.default = fenix.packages.${system}.minimal.toolchain;

      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            hardware-configuration
            nixos-configuration
            home-manager.nixosModules.default
            { home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ]; }
            (
              { pkgs, ... }:
              {
                nixpkgs.overlays = [ fenix.overlays.default ];
                environment.systemPackages = with pkgs; [
                  (fenix.packages.${system}.complete.withComponents [
                    "cargo"
                    "clippy"
                    "rust-src"
                    "rustc"
                    "rustfmt"
                  ])
                  rust-analyzer-nightly
                ];
              }
            )
          ];
        };
      };

      devShells."${system}" =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        # pkgs = nixpkgs.legacyPackages.${system};
        {
          default = import ./shells/default.nix {
            inherit pkgs;
          };
          tauri = import ./shells/tauri.nix {
            inherit pkgs;
          };
          work = import ./shells/work.nix {
            inherit pkgs;
          };
        };
    };

}
