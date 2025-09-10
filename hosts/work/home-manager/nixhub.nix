{ inputs, ... }:
{
  imports = [
    inputs.nixhub.homeModules.hyprland
  ];

  nixhub = {
    hyprland = {
      monitor = [
        # Laptop
        "eDP-1, 2560x1600@90, 0x0, 1"

        # Main screen
        "DP-8, 2560x1440@75, 0x-1440, 1"

        # Left screen
        "DP-7, 2560x1440@75, -1440x-2560, 1, transform, 1"
      ];

      workspace = [
        "1, monitor:DP-8"
        "2, monitor:DP-8"
        "3, monitor:DP-8"
        "4, monitor:DP-8"
        "5, monitor:DP-8"
        "6, monitor:DP-8"
        "7, monitor:DP-8"
        "8, monitor:DP-7"
        "9, monitor:DP-eDP-1"
      ];
    };
  };
}
