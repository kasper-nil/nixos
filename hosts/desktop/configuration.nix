{
  inputs,
  pkgs,
  ...
}:
{
  # NixOS modules
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./modules
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

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
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
    webcord
    spotify
    openrgb-with-all-plugins
    inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
    xarchiver
    alacritty

    # gaming
    prismlauncher
    lutris

    # other
    rofi
    hyprpaper
  ];

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;
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
