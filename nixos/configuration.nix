{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    # Import nixos modules
    ../modules/nixos/bootloader.nix
    ../modules/nixos/display-manager/plasma-awesome.nix
    ../modules/nixos/home-manager.nix
    ../modules/nixos/i18n.nix
    ../modules/nixos/sound.nix
    ../modules/nixos/networking.nix
    ../modules/nixos/keyboard.nix
    ../modules/nixos/users.nix
    ../modules/nixos/shell.nix
    ../modules/nixos/bluetooth.nix
    ../modules/nixos/fonts.nix
    ../modules/nixos/steam.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    vscode
    brave
    htop
    gnumake
    blueman
    nixd
    nixfmt-rfc-style
    pavucontrol
    alsa-utils
    ranger
    feh
    picom
    wmctrl
    discord
    spotify
    inputs.zen-browser.packages."${system}".default
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Add any missing dynamic libraries for unpackaged programs
      # here, NOT in environment.systemPackages
      luaformatter
    ];
  };

  # Stuff for nixd LSP
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Enable experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}
