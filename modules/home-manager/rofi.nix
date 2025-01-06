{ config, lib, ... }:
{
  options = {
    rofi.enable = lib.mkEnableOption "Enable rofi";
  };

  config = lib.mkIf config.rofi.enable {
    home.file."${config.home.homeDirectory}/.config/rofi/config.rasi" = {
      source = ../../dotfiles/rofi/config.rasi;
    };

    home.file."${config.home.homeDirectory}/.config/rofi/themes/nord.rasi" = {
      source = ../../dotfiles/rofi/themes/nord.rasi;
    };
  };
}
