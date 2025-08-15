{
  ...
}:
{
  programs.hyprpanel = {
    enable = true;

    # See 'https://hyprpanel.com/configuration/settings.html'.
    settings = {
      bar = {
        layouts = {
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
