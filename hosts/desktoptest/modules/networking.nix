{ pkgs, ... }:
{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn # ←-- the missing plug-in
        # add others here if you use them
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
