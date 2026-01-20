{ pkgs, ... }:
{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;

      dns = "systemd-resolved";

      wifi = {
        powersave = false;
      };

      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
  };
}
