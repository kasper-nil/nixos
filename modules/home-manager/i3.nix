{ config, pkgs, ... }:
{
  # home.packages = with pkgs; [
  #   i3
  # ];

  home.file."${config.home.homeDirectory}/.config/i3/config" = {
    source = ../../dotfiles/i3;
  };
}
