{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    elementary-xfce-icon-theme
    zuki-themes
  ];

  home.file."${config.home.homeDirectory}/.config/xfce4/xconf/xfce-perchannel-xml" = {
    source = ../../dotfiles/xfce;
    recursive = true;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "elementary-Xfce-dark";
      package = pkgs.elementary-xfce-icon-theme;
    };

    theme = {
      name = "zukitre-dark";
      package = pkgs.zuki-themes;
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
