{ ... }:
{
  qt = {
    enable = true; # exports QT_QPA_PLATFORMTHEME and QT_STYLE_OVERRIDE
    platformTheme.name = "kvantum"; # makes Qt look for settings in qt5ct/qt6ct
    style.name = "kvantum"; # or "qtct" if you want plain qt5ct colours
  };
}
