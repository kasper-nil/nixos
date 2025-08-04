{ pkgs, ... }:
{
  # Enable bluetooth media controls
  systemd = {
    packages = with pkgs; [
      lact
    ];

    services = {
      lactd = {
        wantedBy = [ "multi-user.target" ];
      };
    };

    tmpfiles.rules = [
      # write once at boot, re-applied after every resume
      "w /sys/class/drm/card0/device/power_dpm_force_performance_level - - - - low"
    ];

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
