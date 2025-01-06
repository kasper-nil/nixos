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
    openssl
    openrgb-with-all-plugins
  ];

  # NixOS modules
  imports = [
    ./modules/nixos/default.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  hardware.enableAllFirmware = true;

  security.polkit.enable = true;

  # Stuff for nixd LSP
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  services.hardware.openrgb.enable = true;

  # Enable experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}
