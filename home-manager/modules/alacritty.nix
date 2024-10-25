{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
  };

  home.file."${config.home.homeDirectory}/.config/alacritty/alacritty.toml" = {
    source = ../../dotfiles/alacritty.toml;
  };
}
