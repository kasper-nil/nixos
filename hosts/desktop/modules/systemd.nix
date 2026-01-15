{ pkgs, ... }:
{
  # Enable bluetooth media controls
  systemd = {
    packages = with pkgs; [
      lact
    ];

    services = {
      # Automatically configure flatpak
      flatpak-repo = {
        wantedBy = [ "multi-user.target" ];
        path = [ pkgs.flatpak ];
        script = ''
          flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
      };
      lactd = {
        wantedBy = [ "multi-user.target" ];
      };
    };

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
