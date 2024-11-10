{ pkgs, lib, ... }:
{
  systemd.user.services.plasma-kwin_x11 = {
    wantedBy = lib.mkForce [ ];
  };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager
  services = {
    displayManager = {
      defaultSession = "plasma+awesome";
      sddm.enable = true;
    };

    xserver = {
      enable = true;

      windowManager = {
        awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks # is the package manager for Lua modules
            luadbi-mysql # Database abstraction layer
          ];

        };
      };

      desktopManager = {
        plasma5.enable = true;
      };
    };
  };
}
