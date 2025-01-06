{ lib, config, ... }:
{
  options = {
    networking.enable = lib.mkEnableOption "Enable networking";
  };

  config = lib.mkIf config.networking.enable {
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
    };
  };
}
