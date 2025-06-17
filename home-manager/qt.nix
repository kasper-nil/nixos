{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct # palette/icon GUI for Qt5
    libsForQt5.qtstyleplugin-kvantum
    qt6ct # palette/icon GUI for Qt6
    qt6Packages.qtstyleplugin-kvantum
  ];

  qt = {
    enable = true; # exports QT_QPA_PLATFORMTHEME and QT_STYLE_OVERRIDE
    platformTheme.name = "kvantum"; # makes Qt look for settings in qt5ct/qt6ct
    style.name = "kvantum"; # or "qtct" if you want plain qt5ct colours
  };
}
