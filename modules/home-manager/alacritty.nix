{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/alacritty/alacritty.toml" = {
    source = ../../dotfiles/alacritty.toml;
  };
}
