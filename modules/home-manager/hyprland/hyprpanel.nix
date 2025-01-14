{ inputs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {

    # Enable the module.
    # Default: false
    enable = true;

    # Automatically restart HyprPanel with systemd.
    # Useful when updating your config so that you
    # don't need to manually restart it.
    # Default: false
    systemd.enable = true;

    # Add '/nix/store/.../hyprpanel' to your
    # Hyprland config 'exec-once'.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;

    # Import a theme from './themes/*.json'.
    # Default: ""
    theme = "monochrome";

    overlay.enable = true;

    # Configure bar layouts for monitors.
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # Default: null
    layout = {
      "bar.layouts" = {
        "*" = {
          left = [
            "dashboard"
            "workspaces"
            "windowtitle"
          ];
          middle = [ "clock" ];
          right = [
            "systray"
            "storage"
            "ram"
            "cpu"
            "volume"
            "network"
            "bluetooth"
            "notifications"
          ];
        };
      };
    };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar = {
        launcher = {
          autoDetectIcon = true;
        };
        workspaces = {
          show_numbered = true;
        };
      };
      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = true;
          };
          weather = {
            unit = "metric";
          };
        };
        dashboard = {
          directories = {
            enabled = false;
          };
          stats = {
            enable_gpu = true;
          };
        };
      };
      theme = {
        bar = {
          transparent = false;
          floating = true;
        };
        font = {
          name = "CaskaydiaCove NF";
          size = "16px";
        };
      };
    };
  };
}
