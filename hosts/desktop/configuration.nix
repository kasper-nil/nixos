{
  inputs,
  outputs,
  pkgs,
  ...
}:
{

  # NixOS modules
  imports = [
    ./../../modules/nixos/default.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Enable imported NixOS modules
  amd-graphics.enable = true;
  bluetooth.enable = true;
  bootloader.enable = true;
  desktop-environment.enable = true;
  docker.enable = true;
  fonts.enable = true;
  i18n.enable = true;
  keyboard.enable = true;
  networking.enable = true;
  pipewire.enable = true;
  printing.enable = true;
  steam.enable = true;
  zsh.enable = true;

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

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };

    backupFileExtension = "backup";

    users = {
      kasper = import ./home.nix;
    };
  };

  users = {
    users.kasper = {
      # shell = pkgs.zsh; TODO: Might break stuff
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
