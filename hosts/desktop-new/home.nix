{ ... }:
{
  imports = [
    ../../modules/home-manager
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
}
