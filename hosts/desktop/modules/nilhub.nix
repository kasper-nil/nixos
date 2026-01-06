{ inputs, ... }:
{
  imports = [
    inputs.nilhub.nixosModules.default
  ];

  nilhub = {
    niri = {
      enable = false;
    };

    hyprland = {
      enable = false;
    };

    plasma6 = {
      enable = true;
    };
  };
}
