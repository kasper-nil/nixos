{ pkgs, ... }:
{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };

    wireless = {
      iwd.enable = true;
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 ];
    };
  };
}
