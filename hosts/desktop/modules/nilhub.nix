{ inputs, ... }:
{
  imports = [
    inputs.nilhub.nixosModules.default
  ];

  nilhub = {
    hyprland = {
      enable = true;

      monitor = [
        "DP-1, 2560x1440@165, 0x0, 1"
        "DP-3, 2560x1440@165, -1440x-400, 1, transform, 1"
      ];

      workspace = [
        "1, monitor:DP-1"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:DP-1"
        "5, monitor:DP-1"
        "6, monitor:DP-1"
        "7, monitor:DP-1"
        "8, monitor:DP-1"
        "9, monitor:DP-3"
      ];
    };

    niri = {
      enable = false;
    };

    cosmic = {
      enable = false;
    };

    plasma6 = {
      enable = false;
    };
  };
}
