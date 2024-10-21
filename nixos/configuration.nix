{ 
  inputs,
  outputs, 
  config, 
  pkgs, 
  callPackage, 
  ... 
} : {
  imports =
    [ 
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      ./modules/bootloader.nix
      ./modules/graphics.nix

      # Import home-manager's NixOS module
      inputs.home-manager.nixosModules.home-manager
    ];

  # Home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      kasper = import ../home-manager/home.nix;
    };
  };


  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  security.polkit.enable = true;

  # TODO: figure out what this actually does, i3 didn't work before setting this in
  home-manager.backupFileExtension = "backup";

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Enable sound with pipewire.
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nb_NO.UTF-8";
    LC_IDENTIFICATION = "nb_NO.UTF-8";
    LC_MEASUREMENT = "nb_NO.UTF-8";
    LC_MONETARY = "nb_NO.UTF-8";
    LC_NAME = "nb_NO.UTF-8";
    LC_NUMERIC = "nb_NO.UTF-8";
    LC_PAPER = "nb_NO.UTF-8";
    LC_TELEPHONE = "nb_NO.UTF-8";
    LC_TIME = "nb_NO.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "no";
    variant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "no";

  programs = {
    zsh.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = { 
    users.kasper = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "kasper";
      extraGroups = [ "networkmanager" "wheel" "audio" ];
      packages = with pkgs; [];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
    home-manager
    kitty
    vscode
    brave
    htop
    networkmanagerapplet
    gnumake
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.libinput.touchpad = {
    naturalScrolling = true;
  };
}
