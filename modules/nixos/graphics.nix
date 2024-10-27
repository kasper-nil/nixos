{ pkgs, lib, ... }:
{
  systemd.services.plasma-kwin_x11 = {
    enable = lib.mkForce false;
    wantedBy = lib.mkForce [ ];
  };

  systemd.services.plasma-i3 = {
    enable = true;
    description = "Plasma custom window manager";
    wantedBy = [ "plasma-workspace.target" ];
    before = [ "plasma-workspace.target" ];
    serviceConfig = {
      ExecStart = ''${pkgs.i3}/bin/i3'';
      Slice = "session.slice";
      Restart = "on-failure";
    };
  };

  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager
  services = {
    displayManager = {
      defaultSession = "none+i3";
      sddm.enable = true;
    };

    xserver = {
      enable = true;

      windowManager = {
        i3.enable = true;
      };

      desktopManager = {
        plasma5.enable = true;

        xterm.enable = false;

        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };
    };
  };
}
