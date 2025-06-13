{ inputs, ... }:
{
  imports = [
    ../../home-manager
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
    hyprpanel.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
