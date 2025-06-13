{ ... }:
{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;

    wireless.iwd.enable = true;

    # firewall = {
    #   enable = true;
    #   allowedTCPPorts = [ 64738 ];
    #   allowedUDPPorts = [ 64738 ];
    # };
  };
}
