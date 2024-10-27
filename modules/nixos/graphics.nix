{ pkgs, lib, ... }:
{
  systemd.services.plasma-kwin_x11 = {
    wantedBy = lib.mkForce [ ];
  };

  systemd.user.services.plasma-i3 = {
    enable = true;
    description = "Plasma custom window manager";
    wantedBy = [ "plasma-workspace.target" ];
    before = [ "plasma-workspace.target" ];
    serviceConfig = {
      ExecStart = ''${pkgs.i3}/bin/i3'';
      Restart = "on-failure";
    };
  };

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
