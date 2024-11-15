{
  config,
  lib,
  ...
}:
{
  home = {
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
