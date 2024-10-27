{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      plasma-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        default = lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./hardware-configuration.nix
            ./nixos/configuration.nix
            home-manager.nixosModules.default
            { home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ]; }
          ];
        };
      };

      devShells."${system}".default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          corepack
        ];
        shellHook = ''$SHELL'';
      };
    };

}
