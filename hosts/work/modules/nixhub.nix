{ inputs, ... }:
{
  imports = [
    inputs.nixhub.nixosModules.default
  ];

  nixhub = {
    hyprland = {
      enable = true;
    };
  };
}
