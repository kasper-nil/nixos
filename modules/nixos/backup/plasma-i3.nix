{ pkgs, ... }:
{
  systemd.services."plasma-kwin_x11".enable = false;
  systemd.user.services."plasma-kwin_x11".enable = false;

  qt = {
    enable = true;
  };

  services = {
    displayManager = {
      defaultSession = "plasma+i3";
      sddm = {
        enable = true;
      };
    };

    desktopManager = {
      plasma6 = {
        enable = true;
      };
    };

    xserver = {
      enable = true;
      # displayManager = {
      #   session = [
      #     {
      #       manage = "desktop";
      #       name = "plasma+i3";
      #       start = ''
      #         export KDEWM=${pkgs.i3}/bin/i3
      #         exec ${pkgs.plasma-workspace}/bin/startplasma-x11
      #       '';
      #     }
      #   ];
      # };
    };
  };
}
