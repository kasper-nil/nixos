{ inputs, ... }:
{
  imports = [
    inputs.nixhub.nixosModules.hyprland
  ];
}
