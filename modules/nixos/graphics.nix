{ pkgs, ... }:
{
  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager
  services = {
    displayManager = {
      defaultSession = "xfce+i3";
    };

    desktopManager = {
      plasma6.enable = true;
    };

    xserver = {
      enable = true;

      windowManager = {
        i3.enable = true;
      };

      desktopManager = {
        xterm.enable = false;

        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };

        session = [
          {
            name = "plasma6+i3";
            start = ''exec env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11'';
          }
        ];
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
