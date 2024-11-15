{
  inputs = {
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
  };

  outputs =
    {
      nixpkgs,
      home-manager,
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
