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

    turbo = {
      url = "github:dlip/turbo";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      turbo,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      nixos-configuration = ./configuration.nix;
      hardware-configuration = ./hardware-configuration.nix;
    in
    {
      nixosConfigurations = {
        default = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };

          modules = [
            hardware-configuration
            nixos-configuration
            home-manager.nixosModules.default
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
