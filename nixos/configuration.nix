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
    ../modules/nixos/home-manager.nix
    ../modules/nixos/bootloader.nix
    ../modules/nixos/graphics.nix
    ../modules/nixos/i18n.nix
    ../modules/nixos/sound.nix
    ../modules/nixos/networking.nix
    ../modules/nixos/keyboard.nix
    ../modules/nixos/users.nix
    ../modules/nixos/shell.nix
    ../modules/nixos/bluetooth.nix
    ../modules/nixos/fonts.nix
  ];

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
    # i3-gaps
    # plasma-workspace
  ];

  # Stuff for nixd LSP
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Enable experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05";
}
