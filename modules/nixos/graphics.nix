{ pkgs, lib, ... }:
{
  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager
  services = {
    displayManager = {
      #defaultSession = "none+i3";
      #sddm.enable = true;
      sddm.enable = true;
      defaultSession = "plasma5+i3+whatever";
    };

    desktopManager = {
      # plasma6.enable = true;
    };

    xserver = {
      enable = true;

      displayManager = {
        session = [
          {
            manage = "desktop";
            name = "plasma5+i3+whatever";
            start = ''exec env KDEWM=${pkgs.i3-gaps}/bin/i3 ${pkgs.plasma-workspace}/bin/startplasma-x11'';
          }
        ];
      };

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
