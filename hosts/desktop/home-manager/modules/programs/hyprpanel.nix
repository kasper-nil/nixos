{ inputs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;

    # Automatically restart HyprPanel with systemd.
    # Useful when updating your config so that you
    # don't need to manually restart it.
    systemd.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    overwrite.enable = true;

    # See 'https://hyprpanel.com/configuration/panel.html'.
    settings = {
      layout = {
        "bar.layouts" = {
          "*" = {
            left = [
              "workspaces"
              "windowtitle"
            ];
            middle = [ "clock" ];
            right = [
              "systray"
              "microphone"
              "volume"
              "cpu"
              "ram"
              "hyprsunset"
              "bluetooth"
              "network"
              "dashboard"
            ];
          };
        };
      };
    };

    # See 'https://hyprpanel.com/configuration/settings.html'.
    settings = {
      bar = {
        launcher = {
          autoDetectIcon = true;
        };

        workspaces = {
          workspaces = 5;
          show_numbered = true;
        };

        clock = {
          format = "%H:%M:%S";
        };

        bluetooth = {
          label = false;
        };

        network = {
          label = false;
        };

        customModules = {
          ram = {
            labelType = "used/total";
          };
          hyprsunset = {
            label = false;
            temperature = "3500k"; # colour when you click “On”
            pollingInterval = 2000; # ms
            onIcon = "󱩌";
            offIcon = "󰛨";
          };
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
          };

          weather.enabled = false;
        };

        dashboard = {
          directories.enabled = false;
          shortcuts.enabled = true;
        };
      };

      theme = {
        bar = {
          transparent = true;
          outer_spacing = "0.2em";
        };
      };
    };
  };
}
