{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    iconTheme = {
      name = "Nordic-bluish";
      package = pkgs.nordic;
    };

    font = {
      name = "Noto Sans";
      size = 14;
      package = pkgs.noto-fonts;
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
