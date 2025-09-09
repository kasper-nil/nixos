{ inputs, ... }:
{
  imports = [
    inputs.nixhub.homeModules.hyprland
    ./programs
    ./home.nix
    ./nixpkgs.nix
  ];

  nixhub.hyprland.monitor = [
    "DP-2, 2560x1440@165, auto, 1"
  ];
}
