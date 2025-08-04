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
      lenovo-platform-profile = {
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = ''
            modprobe acpi_call
            echo '\_SB.PCI0.LPC0.EC0.VPC0.DYTC 0x0013B001' > /proc/acpi/call
            echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' > /proc/acpi/call
          '';
        };
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
