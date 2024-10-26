{
  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager

  # kde + i3 setup
  services = {
    xserver = {
      enable = true;
      windowManager = {
        i3.enable = true;
      };
    };
    displayManager = {
      defaultSession = "plasma6+i3";
    };
    desktopManager = {
      plasma6.enable = true;
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
