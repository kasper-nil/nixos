{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ polybar ];

  home.file."${config.home.homeDirectory}/.config/polybar/config.ini" = {
    source = ../../dotfiles/polybar/config.ini;
  };

  home.file."${config.home.homeDirectory}/.config/polybar/launch.sh" = {
    source = ../../dotfiles/polybar/launch.sh;
    executable = true;
  };
}
