{ lib, config, ... }:
{
  options = {
    printing.enable = lib.mkEnableOption "Enable printing";
  };

  config = lib.mkIf config.printing.enable {
    services = {
      printing.enable = true;
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
    };
  };
}
