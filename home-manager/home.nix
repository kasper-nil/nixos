{ pkgs, ... }:
{
  imports = [
    ../modules/home-manager/git.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/alacritty.nix
    ../modules/home-manager/rofi.nix
    ../modules/home-manager/polybar.nix
    ../modules/home-manager/i3.nix
    ../modules/home-manager/picom.nix
    ../modules/home-manager/brave.nix
    ../modules/home-manager/starship.nix
  ];

  home.packages = with pkgs; [
    vscode
    htop
    ranger
    obsidian
    discord
    spotify
    arandr
    neofetch
    wmctrl
    playerctl
    feh
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
