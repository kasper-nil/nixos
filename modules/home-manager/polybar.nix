{
  pkgs,
  config,
  lib,
  ...
}:
{
  home = {
    packages = with pkgs; [
      (polybar.override {
        i3Support = true;
        alsaSupport = true;
        iwSupport = true;
        githubSupport = true;
        pulseSupport = true;
        mpdSupport = true;
      })
    ];

    file."${config.home.homeDirectory}/.config/polybar" = {
      source = ../../dotfiles/polybar;
      executable = true;
      recursive = true;
    };

    activation.myPolybarScriptFix = lib.mkAfter ''
      find ${config.home.homeDirectory}/.config/polybar -name "*.sh" -exec chmod +x {} \;
    '';
  };
}
