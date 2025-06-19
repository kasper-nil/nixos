{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./modules
    ./hardware-configuration.nix
  ];

  home-manager = {
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

  programs = {
    appimage = {
      enable = true;
      binfmt = true;
    };

    thunar.enable = true;

    hyprland = {
      enable = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    # Nix LSP
    nixd
    nixfmt-rfc-style

    # Software
    vscode
    libreoffice
    openrgb-with-all-plugins
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    xarchiver
    wdisplays
    pamixer
    obsidian
    pavucontrol
    flameshot
    brave

    # CLI
    gnumake
    gcc
    openssl
    htop
    ranger
    fastfetch
    autorandr
    tmux
    lazydocker
    omnisharp-roslyn
    powertop
    openvpn
  ];

  environment.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
  };

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
