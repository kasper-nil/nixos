{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    picom
  ];

  home.file."${config.home.homeDirectory}/.config/picom.conf" = {
    source = ../../dotfiles/picom.conf;
  };
}
