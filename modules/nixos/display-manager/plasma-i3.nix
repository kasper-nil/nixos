{ pkgs, lib, ... }:
{
  # qt = {
  #   enable = true;
  #   platformTheme = "gnome";
  #   style = "adwaita-dark";
  # };

  services = {
    displayManager = {
      defaultSession = "plasmax11";
      sddm = {
        enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        # enableQt5Integration = true;
        enable = true;
      };
    };

    xserver = {
      enable = true;
    };
  };
}
