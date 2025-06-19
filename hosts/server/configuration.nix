{ inputs, ... }:
{
  imports = [
    ./modules
    inputs.disko.nixosModules.disko
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  users = {
    mutableUsers = false;
    users.server = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
      ];
      initialPassword = "root"; # use once, then `passwd`
    };
  };

  services = {
    openssh = {
      enable = true;
    };
  };
}
