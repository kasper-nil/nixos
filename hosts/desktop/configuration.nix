{
  inputs,
  pkgs,
  ...
}:
{
  # NixOS modules
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/nixos
    ./hardware-configuration.nix
  ];

  home-manager = {
    backupFileExtension = "home-desktop";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kasper" = import ./home.nix;
    };
  };

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
        "lp"
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
  minecraft-server.enable = true;

  # Desktop environment
  plasma6.enable = true;
  # hyprland.enable = true;

  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    gnumake
    nixd
    nixfmt-rfc-style
    gcc
    openssl
    openrgb-with-all-plugins
    protonup-qt
    lutris
    dotnet-sdk_8
    roslyn-ls
    bottles
    appimage-run
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
    firefox
  ];

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    dotnet-sdk_8
    roslyn-ls
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}/share/dotnet/";
  };

  boot.kernelPackages = pkgs.linuxPackages_6_11;

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
