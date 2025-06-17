{ inputs, ... }:
{
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  programs.hyprpanel = {
    enable = true;
  };
}
