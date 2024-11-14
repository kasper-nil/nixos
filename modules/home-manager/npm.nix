{ config, ... }:
{
  home.file."${config.home.homeDirectory}/.npmrc" = {
    source = ../../dotfiles/.npmrc;
  };
}
