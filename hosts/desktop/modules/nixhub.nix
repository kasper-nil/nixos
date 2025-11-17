{ inputs, ... }:
{
  imports = [
    inputs.nixhub.nixosModules.default
  ];

  nixhub = {
    niri = {
      enable = false;
    };

    hyprland = {
      enable = true;
    };
  };
}
