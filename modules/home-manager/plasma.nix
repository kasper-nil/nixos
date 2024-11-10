{ pkgs, ... }:
{
  home.packages = with pkgs; [
    plasmusic-toolbar
  ];

  programs.plasma = {
    enable = true;

    overrideConfig = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      iconTheme = "Papirus-Dark";
    };

    fonts = {
      # general = {
      #   family = "JetBrains Mono";
      #   pointSize = 12;
      # };
    };

    krunner = {
      position = "center";
      activateWhenTypingOnDesktop = true;
      historyBehavior = "enableAutoComplete";
    };

    shortcuts = {
      "org.kde.krunner.desktop"._launch = [
        "Alt+Space"
        "Meta"
        "Alt+Q"
      ];
    };

    hotkeys.commands = { };

    panels = [
      {
        location = "top";
        hiding = "none";
        widgets = [
          {
            pager = {
              general = {
                showWindowOutlines = true;
                showApplicationIconsOnWindowOutlines = true;
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
            plasmusicToolbar = {
              panelIcon = {
                albumCover = {
                  useAsIcon = false;
                  radius = 8;
                };
                icon = "view-media-track";
              };
              musicControls.showPlaybackControls = true;
              songText = {
                displayInSeparateLines = true;
                maximumWidth = 640;
                scrolling = {
                  behavior = "alwaysScroll";
                  speed = 3;
                };
              };
            };
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
              font = {
                family = "Noto Sans";
                bold = false;
                # size = 8;
              };
            };
          }
        ];
      }
    ];
  };
}
