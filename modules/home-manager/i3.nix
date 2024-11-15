{ config, pkgs, ... }:
let
  config = ../../dotfiles/i3/config;
in
{
  home.packages = with pkgs; [
    i3-rounded
  ];

  home.file."${config.home.homeDirectory}/.config/i3/config" = {
    source = ../../dotfiles/i3;
  };

  # xsession.windowManager.i3 = {
  #   enable = true;
  #   package = pkgs.i3;
  #   extraConfig = ''
  #     include "${config}";
  #   '';
  # };
}
