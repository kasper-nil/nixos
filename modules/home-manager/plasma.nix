{ pkgs, ... }:
{
  # Setup systemd services, replacing kwin with i3
  systemd.user.services = {
    plasma-kwin_x11 = {
      Install = {
        WantedBy = [ ];
      };
    };
    plasma-i3_x11 = {
      Install = {
        WantedBy = [ "plasma-workspace.target" ];
      };
      Unit = {
        Description = "KDE Plasma with i3wm";
        Before = "plasma-workspace.target";
      };
      Service = {
        ExecStart = ''
          ${pkgs.i3}/bin/i3
        '';
        Slice = "session.slice";
        Restart = "on-failure";
      };
    };
  };

  programs.plasma = {
    enable = true;

    overrideConfig = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    krunner = {
      position = "center";
    };

    shortcuts = {
      "org.kde.krunner.desktop"._launch = [
        "Meta+D"
      ];
    };

    hotkeys.commands = { };

    panels = [
      {
        location = "top";
        hiding = "none";
        floating = true;
        widgets = [
          {
            pager = {
              general = {
                # showWindowOutlines = true;
                # showApplicationIconsOnWindowOutlines = true;
                showOnlyCurrentScreen = false;
                displayedText = "desktopName";
              };
            };
          }
          {
            name = "org.kde.plasma.panelspacer";
          }
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [ ];
                showTasks = "onlyInCurrentDesktop";
              };
            };
          }
          {
            name = "org.kde.plasma.panelspacer";
          }
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.volume"
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.battery"
              ];
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "monday";
              time.format = "24h";
            };
          }
        ];
      }
    ];
  };
}
