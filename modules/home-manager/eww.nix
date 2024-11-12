{ pkgs, ... }:
{
  programs.eww = {
    enable = true;
    configDir = ../../dotfiles/eww-bar;
    package = pkgs.eww;
  };
}
