{ pkgs, lib, ... }:
{
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
      };

      desktopManager = {
        plasma5 = {
          enable = true;
          runUsingSystemd = true;
        };

        xterm.enable = false;
      };
    };
  };
}
