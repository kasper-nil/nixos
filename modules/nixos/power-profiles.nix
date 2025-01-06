{ lib, config, ... }:
{
  options = {
    power-profiles.enable = lib.mkEnableOption "Enable power-profiles";
  };

  config = lib.mkIf config.power-profiles.enable {
    services.power-profiles-daemon.enable = true;
    services.thermald.enable = true;
  };
}
