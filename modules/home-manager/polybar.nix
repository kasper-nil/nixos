{ pkgs, config, ... }:
{
  home = {
    packages = with pkgs; [
      (polybar.override {
        i3Support = true;
        alsaSupport = true;
        iwSupport = true;
        githubSupport = true;
        pulseSupport = true;
      })
    ];

    file = {
      "${config.home.homeDirectory}/.config/polybar" = {
        source = ../../dotfiles/polybar;
        recursive = true;
      };

      "${config.home.homeDirectory}/.config/polybar/launch.sh" = {
        source = ../../dotfiles/polybar/launch.sh;
        executable = true;
      };
    };
  };
}
