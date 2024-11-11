{ config, ... }:
{
  # enable awesomewm
  home.file."${config.home.homeDirectory}/..config/awesome/rc.lua" = {
    source = ../../dotfiles/awesome.lua;
  };
}
