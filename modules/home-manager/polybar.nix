{ pkgs, config, ... }:
{
  home.file = {
    # "${config.home.homeDirectory}/.config/polybar/launch.sh" = {
    #   source = ../../dotfiles/polybar/launch.sh;
    #   executable = true;
    # };

    "${config.home.homeDirectory}/.config/polybar" = {
      source = ../../dotfiles/polybar;
      recursive = true;
      executable = true;
    };

    #"${config.home.homeDirectory}/.config/polybar/config.ini" = {
    #  source = ../../dotfiles/polybar/config.ini;
    #};
    #
  };

  services.polybar = {
    enable = true;
    script = "";
    package = pkgs.polybar.override {
      i3Support = true;
      alsaSupport = true;
      iwSupport = true;
      githubSupport = true;
    };
  };
}
