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
      enable = true;
    };

    cosmic = {
      enable = false;
    };

    plasma6 = {
      enable = false;
    };
  };
}
