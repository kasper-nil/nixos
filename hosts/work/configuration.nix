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
    alacritty
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
