{ inputs, pkgs, ... }:
{
  # NixOS modules
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./modules
    ./hardware-configuration.nix
  ];

  home-manager = {
    backupFileExtension = "home";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "kasper" =
        { ... }:
        {
          nixpkgs.config.allowUnfree = true;
          imports = [ ../../home-manager ];
          home = {
            username = "kasper";
            homeDirectory = "/home/kasper";
            stateVersion = "24.05";
          };
        };
    };
  };

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };

    thunar.enable = true;

    hyprland = {
      enable = true;
    };

    nix-ld = {
      enable = true;
    };
  };

  services = {
    hardware.openrgb.enable = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    nixd
    nixfmt-rfc-style

    protonup-qt
    ffmpeg-full

    # cli tools
    ranger
    htop
    tmux
    openvpn
    fastfetch

    # software
    vscode
    libreoffice
    openrgb-with-all-plugins
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    xarchiver
    qbittorrent
    wdisplays
    pamixer
    pavucontrol

    # gaming
    prismlauncher
    lutris

    playerctl
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
        "lp"
      ];
    };
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
  };

  hardware.enableAllFirmware = true;

  nix = {
    # Stuff for nixd LSP
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "server"
      ];
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  system.stateVersion = "24.05";
}
