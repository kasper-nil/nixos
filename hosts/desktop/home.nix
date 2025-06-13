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
  };

  nixpkgs.config.allowUnfree = true;

  home.file.".config/rofi/config.rasi" = {
    source = ../../dotfiles/rofi/config.rasi;
  };

  home.file.".config/rofi/themes/mocha.rasi" = {
    source = ../../dotfiles/rofi/themes/mocha.rasi;
  };

  home.file.".config/hypr/themes/mocha.conf" = {
    source = ../../dotfiles/hypr/themes/mocha.conf;
  };

  programs.hyprpanel.enable = true;
}
