{ inputs, ... }:
{
  imports = [
    inputs.nixhub.nixosModules.hyprland
    # inputs.nixhub.nixosModules.niri
  ];

  nixhub = {
    # niri = {
    #   enable = false;
    # };

    hyprland = {
      enable = true;
    };
  };
}
