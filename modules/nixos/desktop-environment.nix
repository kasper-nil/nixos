{
  services = {
    displayManager = {
      defaultSession = "xfce+i3";
    };

    xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };

      windowManager = {
        i3.enable = true;
      };
    };
  };
}
