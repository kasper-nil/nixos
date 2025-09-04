{ pkgs, ... }:
{
  # Enable bluetooth media controls
  systemd = {
    packages = with pkgs; [
      lact
    ];

    services.lactd.wantedBy = [ "multi-user.target" ];

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
