{ inputs, ... }:
{
  imports = [
    inputs.nilhub.nixosModules.default
  ];

  nilhub = {
    hyprland = {
      enable = true;
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
