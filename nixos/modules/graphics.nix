{
  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager

  services = {
    displayManager = {
      defaultSession = "none+i3";
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
      };
    };
  };
}
