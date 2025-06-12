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
  lact.enable = true;

  # Desktop environment
  plasma6.enable = true;
  # hyprland.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
      permittedInsecurePackages = [
        "ventoy-1.1.05"
      ];
    };
  };

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
    dotnet-sdk_9
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
    floorp
    libreoffice
    openvpn
    ventoy
    ffmpeg-full

    # Add unity hub with a fix
    # This is needed because unity hub does not save preferences otherwise
    (pkgs.buildFHSUserEnv {
      name = "unityhub-fixed";
      targetPkgs = pkgs: [ pkgs.unityhub ];
      runScript = "unityhub";
      extraBwrapArgs = [
        "--setenv"
        "HOME"
        "$HOME"
      ];
    })

    # firefox
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
  ];

  # Disable update prompt in zen browser
  # programs.firefox = {
  #   enable = true;
  #   policies = {
  #     BlockAboutConfig = true;
  #   };
  # };

  services.desktopManager.cosmic.enable = true;

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

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
    kernelParams = [ "amdgpu.sg_display=0" ];
  };

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
