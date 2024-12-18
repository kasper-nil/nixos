{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zuki-themes
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

      displayManager = {
        lightdm = {
          enable = true;
          greeters.slick = {
            enable = true;
            theme.name = "Zukitre-dark";
          };
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
