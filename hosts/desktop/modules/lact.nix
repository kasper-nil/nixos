{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    lact.enable = lib.mkEnableOption "Enable lact";
  };

  config = lib.mkIf config.lact.enable {
    environment.systemPackages = with pkgs; [ lact ];
    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  };
}
