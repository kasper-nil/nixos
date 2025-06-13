# home-manager/home.nix
{ pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      # the “appearance” part
      name = "catppuccin-mocha-lavender-standard+default"; # or whatever you used on Arch
      package = pkgs.catppuccin-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "catppuccin-cursors-mocha";
      package = pkgs.catppuccin-cursors-mocha;
    };

    # Force dark variant for GTK 3
    gtk3.extraConfig."gtk-application-prefer-dark-theme" = 1;

    # Point GTK at your old settings.ini files
    # (You could inline the options instead, but re-using the file is nice.)
  };
}
