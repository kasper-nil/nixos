{ pkgs, config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/kwinrc" = {
    source = ../../dotfiles/kwinrc;
  };

  # Setup systemd services
  systemd.user.services = {
    # Disable kwin
    plasma-kwin_x11 = {
      Install = {
        WantedBy = [ ];
      };
      Unit = {
        Before = [ ];
        After = [ ];
      };
      Service = {
        ExecStart = "";
        Restart = "";
      };
    };
    # Create a custom service to use i3wm
    plasma-i3_x11 = {
      Install = {
        WantedBy = [ "plasma-workspace.target" ];
      };
      Unit = {
        Description = "KDE Plasma with i3wm";
        Before = [ "plasma-workspace.target" ];
      };
      Service = {
        ExecStart = ''
          ${pkgs.i3}/bin/i3
        '';
        Slice = "session.slice";
        Restart = "on-failure";
      };
    };
  };
}
