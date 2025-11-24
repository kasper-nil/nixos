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
  };
}
