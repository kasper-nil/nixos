{ ... }:
{
  home.pointerCursor = {
    gtk.enable = true; # GTK 3/4 + Flatpaks
    x11.enable = true; # XWayland / i3 / remote X
    hyprcursor = {
      enable = true; # sets HYPRCURSOR_THEME & writes Hyprland stanza
    };
  };
}
