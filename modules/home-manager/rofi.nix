{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi ];

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
  };
}
