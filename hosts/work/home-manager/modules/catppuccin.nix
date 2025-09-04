{ inputs, ... }:
{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;

    flavor = "mocha";
    accent = "lavender";

    cursors = {
      enable = true;
      accent = "lavender";
      flavor = "mocha";
    };

    hyprland = {
      enable = true;
    };

    kvantum = {
      enable = true;
    };
  };
}
