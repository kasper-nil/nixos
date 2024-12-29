{
  inputs,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    gnumake
    nixd
    nixfmt-rfc-style
    gcc
    pkg-config
    i3-gaps
    direnv
    i3lock-fancy
    openssl
  ];

  # NixOS modules
  imports = [
    ./modules/nixos/bootloader.nix
    ./modules/nixos/home-manager.nix
    ./modules/nixos/desktop-environment.nix
    ./modules/nixos/i18n.nix
    ./modules/nixos/sound.nix
    ./modules/nixos/networking.nix
    ./modules/nixos/keyboard.nix
    ./modules/nixos/users.nix
    ./modules/nixos/shell.nix
    ./modules/nixos/bluetooth.nix
    ./modules/nixos/fonts.nix
    ./modules/nixos/virtualisation.nix
    ./modules/nixos/steam.nix
    ./modules/nixos/graphics.nix
    ./modules/nixos/power.nix
    ./modules/nixos/printing.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  hardware.enableAllFirmware = true;

  security.polkit.enable = true;

  # Stuff for nixd LSP
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Enable experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}
