{ 
  inputs,
  outputs, 
  config, 
  pkgs, 
  callPackage, 
  ... 
} : {
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules/home-manager.nix
    ./modules/bootloader.nix
    ./modules/graphics.nix
    ./modules/i18n.nix
    ./modules/sound.nix
    ./modules/networking.nix
    ./modules/keyboard.nix
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    kitty
    vscode
    brave
    htop
    networkmanagerapplet
    gnumake
  ];

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

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
