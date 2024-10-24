{
  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager

  services = {
    displayManager = {
      defaultSession = "xfce+i3";
    };

    xserver = {
      enable = true;

      windowManager = {
        i3.enable = false;
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
