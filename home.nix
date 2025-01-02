{ pkgs, ... }:
{
  imports = [
    ./modules/home-manager/git.nix
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/alacritty.nix
    ./modules/home-manager/starship.nix

    # ./modules/home-manager/i3.nix
    # ./modules/home-manager/gtk.nix
    # ./modules/home-manager/picom.nix
    # ./modules/home-manager/rofi.nix
    # ./modules/home-manager/polybar.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];

  home.packages = with pkgs; [
    vscode
    htop
    ranger
    obsidian
    discord
    spotify
    neofetch
    brave
    alacritty
    powertop
    flameshot
    autorandr
    tmux
    lazydocker
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
