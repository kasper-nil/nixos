{ pkgs, lib, ... }:
{
  imports = [
    ../modules/home-manager/plasma.nix
    ../modules/home-manager/i3.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/alacritty.nix
    ../modules/home-manager/rofi.nix
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
