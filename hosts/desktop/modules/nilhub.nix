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

    cosmic = {
      enable = true;
    };

    plasma6 = {
      enable = false;
    };
  };
}
