{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ../../modules/nixos
    ./hardware-configuration.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kasper" = import ./home.nix;
    };
  };

  users.users = {
    kasper = {
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
  power-profiles.enable = true;
  zsh.enable = true;

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
    vscode
    htop
    ranger
    obsidian
    discord
    spotify
    neofetch
    brave
    powertop
    flameshot
    autorandr
    tmux
    lazydocker
    anydesk
    omnisharp-roslyn
    openvpn
    code-cursor
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc.lib
    glibc
    zlib
    libuuid
    icu
    curl
    openssl
    # add more if needed
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;

  hardware.enableAllFirmware = true;

  services.openssh = {
    enable = true;
  };

  # security.polkit.enable = true; TODO: This might break stuff

  # Stuff for nixd LSP
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Enable experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "24.05";
}
