{ config, pkgs, ... }:
{
  home.file."${config.home.homeDirectory}/.config/i3/config" = {
    source = ../../dotfiles/i3/config;
  };

  # xsession.windowManager.i3 = {
  #   enable = true;
  #   package = pkgs.i3;
  #   extraConfig = ''
  #     include "${config}";
  #   '';
  # };
}
