{ inputs, ... }:
{
  imports = [
    inputs.nilhub.nixosModules.default
  ];

  nilhub = {
    hyprland = {
      enable = true;
    };
  };
}
