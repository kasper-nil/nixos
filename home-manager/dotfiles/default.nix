{ ... }:
{
  home = {
    file.".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };

    file.".config/alacritty" = {
      source = ./alacritty;
      recursive = true;
    };

    file.".config/gtk-3.0" = {
      source = ./gtk-3.0;
      recursive = true;
    };

    file.".config/gtk-4.0" = {
      source = ./gtk-4.0;
      recursive = true;
    };

    file.".config/qt5ct" = {
      source = ./qt5ct;
      recursive = true;
    };

    file.".config/qt6ct" = {
      source = ./qt6ct;
      recursive = true;
    };

    file.".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
  };
}
