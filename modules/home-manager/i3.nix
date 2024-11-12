{ config, pkgs, ... }:
{
  home.file."${config.home.homeDirectory}/.config/i3/config" = {
    source = ../../dotfiles/i3;
  };
}
