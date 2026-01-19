{ pkgs, ... }:
{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;

      wifi = {
        powersave = false;
      };

      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
    };
  };
}
