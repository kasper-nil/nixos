{
  inputs,
  pkgs,
  ...
}:
{
  system.stateVersion = "24.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixpkgs.config = {
    allowUnfree = true;

    packageOverrides = pkgs: {
      polybar = pkgs.polybar.override {
        i3Support = true;
      };
    };
  };

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

  # System packages
  environment.systemPackages = with pkgs; [
    home-manager
    vscode
    brave
    htop
    gnumake
    nixd
    nixfmt-rfc-style
    ranger
    feh
    discord
    spotify
    inputs.zen-browser.packages."${system}".default
    arandr
    neofetch
    i3
    wmctrl
    starship
    playerctl
    gcc
    pkg-config
    direnv
    obsidian
  ];

  # NixOS modules
  imports = [
    ../modules/nixos/bootloader.nix
    ../modules/nixos/home-manager.nix
    ../modules/nixos/desktop-environment.nix
    ../modules/nixos/i18n.nix
    ../modules/nixos/sound.nix
    ../modules/nixos/networking.nix
    ../modules/nixos/keyboard.nix
    ../modules/nixos/users.nix
    ../modules/nixos/shell.nix
    ../modules/nixos/bluetooth.nix
    ../modules/nixos/fonts.nix
    ../modules/nixos/steam.nix
    ../modules/nixos/virtualisation.nix
  ];
}
