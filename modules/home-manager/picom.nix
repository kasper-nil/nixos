{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/picom.conf" = {
    source = ../../dotfiles/picom.conf;
  };
}
