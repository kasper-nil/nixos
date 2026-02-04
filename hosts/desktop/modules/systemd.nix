{ pkgs, ... }:
{
  systemd = {
    # LACT AMD GPU control
    packages = [ pkgs.lact ];

    services = {
      lactd = {
        wantedBy = [ "multi-user.target" ];
      };
    };

    # Bluetooth media controls
    user.services.mpris-proxy = {
      description = "Mpris proxy";
      after = [
        "network.target"
        "sound.target"
      ];
      wantedBy = [ "default.target" ];
      serviceConfig.ExecStart = "${pkgs.bluez}/bin/mpris-proxy";
    };
  };
}
