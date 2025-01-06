{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    gtk-themes.enable = lib.mkEnableOption "Enable gtk themes";
  };

  config = lib.mkIf config.gtk-themes.enable {
    gtk = {
      enable = true;

      theme = {
        name = "Qogir-dark";
        package = pkgs.qogir-theme;
      };

      iconTheme = {
        name = "Qogir-dark";
        package = pkgs.qogir-icon-theme;
      };

      font = {
        name = "Roboto";
        size = 14;
        package = pkgs.roboto;
      };

      cursorTheme = {
        name = "Qogir-dark";
        package = pkgs.qogir-theme;
        size = 32;
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

    home.pointerCursor = {
      gtk.enable = true;
      name = "Qogir-dark";
      package = pkgs.qogir-theme;
      size = 32;
    };
  };
}
