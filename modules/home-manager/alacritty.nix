{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/alacritty/alacritty.yaml" = {
    source = ../../dotfiles/alacritty.yaml;
  };
}
