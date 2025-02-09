{ pkgs, ... }:
{
  imports = [
    ./../../modules/home-manager/default.nix
  ];

  # Enable imported modules
  git.enable = true;
  zsh.enable = true;
  alacritty.enable = true;
  starship.enable = true;

  # hyprland.enable = true;
  # plasma6.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
  ];

  home.packages = with pkgs; [
    vscode
    webcord
    htop
    ranger
    obsidian
    discord
    spotify
    neofetch
    brave
    powertop
    tmux
    lazydocker
    prismlauncher
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
