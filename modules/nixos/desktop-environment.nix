{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xfce.xfce4-panel
    xfce.xfce4-i3-workspaces-plugin
    xfce.xfce4-pulseaudio-plugin
  ];

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services = {
    displayManager = {
      defaultSession = "xfce+i3";
    };

    xserver = {
      enable = true;

      videoDrivers = [ "modesetting" ];

      desktopManager = {
        xterm = {
          enable = false;
        };
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };

      windowManager = {
        i3 = {
          enable = true;
          package = pkgs.i3-gaps;
        };
      };
    };
  };
}
