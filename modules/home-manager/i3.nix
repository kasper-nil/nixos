{ config, lib, ... }:
{
  options = {
    i3.enable = lib.mkEnableOption "Enable i3";
  };

  config = lib.mkIf config.i3.enable {
    home.file."${config.home.homeDirectory}/.config/i3/config" = {
      source = ../../dotfiles/i3/config;
    };
  };
}
