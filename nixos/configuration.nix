{
  inputs,
  outputs,
  config,
  pkgs,
  callPackage,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Import nixos modules
    ./modules/home-manager.nix
    ./modules/bootloader.nix
    ./modules/graphics.nix
    ./modules/i18n.nix
    ./modules/sound.nix
    ./modules/networking.nix
    ./modules/keyboard.nix
    ./modules/users.nix
    ./modules/shell.nix
    ./modules/bluetooth.nix
  ];

  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    kitty
    vscode
    brave
    htop
    gnumake
    blueman
    nixd
    nixfmt-rfc-style
    starship
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
