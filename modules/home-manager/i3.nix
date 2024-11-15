{ config, pkgs, ... }:
{
  # home.file."${config.home.homeDirectory}/.config/i3/config" = {
  #   source = ../../dotfiles/i3;
  # };
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-rounded;
    configFile = ../../dotfiles/i3/config;
  };
}
