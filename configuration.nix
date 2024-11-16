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
  ];

  # NixOS modules
  imports = [
    ./modules/nixos/bootloader.nix
    ./modules/nixos/home-manager.nix
    ./modules/nixos/xserver.nix
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
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

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
