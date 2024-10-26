{ pkgs, lib, ... }:
{
  systemd.services.plasma-kwin_x11.wantedBy = lib.mkForce [ ];

  systemd.services.plasma-i3 = {
    enable = true;
    description = "Plasma custom window manager";
    wantedBy = [ "plasma-workspace.target" ];
    before = [ "plasma-workspace.target" ];
    serviceConfig = {
      ExecStart = ''/usr/bin/i3'';
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

    desktopManager = {
      # plasma6.enable = true;
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

  # xfce + i3 setup
  #services = {
  #  displayManager = {
  #    defaultSession = "xfce+i3";
  #    };
  #
  #  xserver = {
  #      enable = true;
  #
  #    windowManager = {
  #      i3.enable = true;
  #      };
  #
  #    desktopManager = {
  #      xterm.enable = false;
  #      xfce = {
  #        enable = true;
  #        noDesktop = true;
  #        enableXfwm = false;
  #      };
  #    };
  #  };
  #};
}
