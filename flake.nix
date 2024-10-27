{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
      nixos-configuration = ./nixos/configuration.nix;
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
            { home-manager.sharedModules = [ plasma-manager.homeManagerModules.plasma-manager ]; }
          ];
        };
      };

      devShells."${system}".default =
        let
          pkgs = import nixpkgs { inherit system; };
        in
        pkgs.mkShell {
          packages = with pkgs; [
            nodejs
            corepack
          ];
          shellHook = ''$SHELL'';
        };
    };

}
