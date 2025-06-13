{
  config,
  ...
}:
{
  programs.alacritty.enable = true;

  home.file."${config.home.homeDirectory}/.config/alacritty" = {
    source = ./dotfiles;
    recursie = true;
  };
}
