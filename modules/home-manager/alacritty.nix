{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    alacritty.enable = lib.mkEnableOption "Enable alacritty";
  };

  config = lib.mkIf config.alacritty.enable {
    home.packages = with pkgs; [
      alacritty
    ];

    home.file."${config.home.homeDirectory}/.config/alacritty/alacritty.toml" = {
      source = ../../dotfiles/alacritty.toml;
    };
  };
}
