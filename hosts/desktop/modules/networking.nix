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

    firewall = {
      enable = true;
      allowedTCPPorts = [ 3000 ];
    };
  };
}
