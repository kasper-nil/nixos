{
  inputs,
  pkgs,
  ...
}:
{

  # NixOS modules
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users = {
    users.kasper = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "kasper";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "docker"
        "video"
      ];
    };
  };

  # Enable imported NixOS modules
  amd-graphics.enable = true;
  bluetooth.enable = true;
  bootloader.enable = true;
  docker.enable = true;
  fonts.enable = true;
  i18n.enable = true;
  keyboard.enable = true;
  networking.enable = true;
  pipewire.enable = true;
  printing.enable = true;
  steam.enable = true;
  zsh.enable = true;

  # Desktop environment
  plasma6.enable = true;
  # hyprland.enable = true;

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
    protonup-qt
    lutris
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  hardware.enableAllFirmware = true;

  # security.polkit.enable = true; TODO: This might break stuff

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
