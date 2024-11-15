{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    nordic
  ];

  # home.file."${config.home.homeDirectory}/.config/xfce4/xconf/xfce-perchannel-xml" = {
  #   source = ../../dotfiles/xfce;
  #   recursive = true;
  # };

  home.file."${config.home.homeDirectory}/.config/gtk-3.0/gtk.css" = {
    source = ../../dotfiles/xfce/gtk.css;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "nordic-darker";
      package = pkgs.nordic;
    };

    theme = {
      name = "nordic-darker";
      package = pkgs.nordic;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
}
