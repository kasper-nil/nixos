{ pkgs, ... }:
{
  home.packages = with pkgs; [ alacritty ];

  programs.alacritty = {
    enable = true;
    settings = ''
      [font]
      size = 12
    '';
  };
}
