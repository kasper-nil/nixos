{ inputs, ... }:
{
  imports = [
    inputs.nixhub.homeModules.hyprland
  ];

  nixhub = {
    hyprland = {
      monitor = [
        "DP-2, 2560x1440@165, auto, 1"
        "DP-1, 2560x1440@165, -1440x-480, 1, transform, 1"
      ];

      workspace = [
        "1, monitor:DP-2"
        "2, monitor:DP-2"
        "3, monitor:DP-2"
        "4, monitor:DP-2"
        "5, monitor:DP-2"
        "6, monitor:DP-2"
        "7, monitor:DP-2"
        "8, monitor:DP-2"
        "9, monitor:HDMI-A-1"
      ];

      hyprpanel = {
        monitor = [ "DP-2" ];
      };
    };
  };
}
