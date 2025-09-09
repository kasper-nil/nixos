{ inputs, ... }:
{
  imports = [
    inputs.nixhub.nixosModules.hyprland

    ./hardware-configuration.nix

    ./modules

    ./home-manager.nix
  ];
}
