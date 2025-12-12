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

    i3 = {
      enable = false;
    };
  };
}
