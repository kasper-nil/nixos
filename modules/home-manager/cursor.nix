{ pkgs, ... }:
{
  home.pointerCursor = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 40;
    x11.defaultCursor = "Nordzy-cursors";
  };

  gtk.cursorTheme = {
    name = "Nordzy-cursors";
    package = pkgs.nordzy-cursor-theme;
    size = 40;
  };
}
