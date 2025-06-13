{
  ...
}:
{
  programs.alacritty.enable = true;

  home.file.".config/alacritty" = {
    source = ../../dotfiles/alacritty; # directory right next to this file
    recursive = true;
  };
}
