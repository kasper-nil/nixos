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
        "DP-17, 2560x1440@75, 0x-1440, 1"

        # Left screen
        "DP-16, 2560x1440@75, -1440x-2560, 1, transform, 1"
      ];
    };
  };
}
