{ inputs, ... }:
{
  imports = [
    # inputs.nixhub.nixosModules.hyprland
    inputs.nixhub.nixosModules.niri
  ];
}
