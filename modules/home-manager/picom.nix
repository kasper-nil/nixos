{ config, lib, ... }:
{
  options = {
    picom.enable = lib.mkEnableOption "Enable picom";
  };

  config = lib.mkIf config.picom.enable {
    home.file."${config.home.homeDirectory}/.config/picom.conf" = {
      source = ../../dotfiles/picom.conf;
    };
  };
}
