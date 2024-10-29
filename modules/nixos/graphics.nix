{ pkgs, lib, ... }:
{
  systemd.user.services.plasma-kwin_x11 = {
    wantedBy = lib.mkForce [ ];
  };

  # systemd.user.services.plasma-i3 = {
  #   enable = true;
  #   description = "Plasma custom window manager";
  #   wantedBy = [ "default.target" ];
  #   before = [ "plasma-workspace.target" ];
  #   serviceConfig = {
  #     User = "kasper";
  #     Group = "root";
  #     ExecStart = "${pkgs.writeShellScript "start-i3" ''
  #       #!/usr/bin/env bash
  #       ${pkgs.i3}/bin/i3
  #     ''}";
  #     Restart = "on-failure";
  #   };
  # };

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.dconf.enable = true;

  # Options for all of the graphical aspects of the OS
  # Configures display manager, window manager and desktop manager
  services = {
    displayManager = {
      defaultSession = "plasma+i3";
      sddm.enable = true;
    };

    # desktopManager = {
    #   plasma6.enable = true;
    #   plasma6.enableQt5Integration = true;
    # };

    xserver = {
      enable = true;

      windowManager = {
        i3.enable = true;
      };

      displayManager = {
        session = [
          {
            manage = "desktop";
            name = "plasma";
            start = ''
              export KDEWM=${pkgs.i3}/bin/i3
              export QT_QPA_PLATFORMTHEME="qt5ct"
              exec ${pkgs.plasma-workspace}/bin/startplasma-x11
            '';
          }
        ];
      };

      desktopManager = {
        plasma5.enable = true;

        xterm.enable = false;
      };
    };
  };
}
