{ pkgs, nixpkgs, ... }:
{
  imports = [
    ./modules/home-manager/git.nix
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/alacritty.nix
    ./modules/home-manager/rofi.nix
    ./modules/home-manager/polybar.nix
    ./modules/home-manager/i3.nix
    ./modules/home-manager/picom.nix
    ./modules/home-manager/starship.nix
    ./modules/home-manager/gtk.nix
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
    brave
    dconf
    alacritty
    rofi
    picom
    (polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
      pulseSupport = true;
      mpdSupport = true;
    })
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
