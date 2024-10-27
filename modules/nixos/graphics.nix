{ pkgs, lib, ... }:
{
  systemd.user.services.plasma-kwin_x11 = {
    # enable = lib.mkForce false;
    wantedBy = lib.mkForce [ ];
  };

  systemd.user.services.plasma-i3 = {
    enable = true;
    description = "Plasma custom window manager";
    wantedBy = [ "plasma-workspace.target" ];
    before = [ "plasma-workspace.target" ];
    serviceConfig = {
      ExecStart = ''${pkgs.i3}/bin/i3'';
      Restart = "on-failure";
    };
  };

  qt = {
    enable = true;
  };

  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager
  services = {
    displayManager = {
      defaultSession = "plasma";
      sddm.enable = true;
    };

    xserver = {
      enable = true;

      windowManager = {
        i3.enable = true;
        # i3.package = pkgs.i3-gaps;
      };

      desktopManager = {
        plasma5 = {
          enable = true;
          runUsingSystemd = true;
        };

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
