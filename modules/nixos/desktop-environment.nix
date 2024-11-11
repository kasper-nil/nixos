{
  qt = {
    enable = true;
  };

  services = {
    displayManager = {
      defaultSession = "plasmax11";
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

      #displayManager = {
      #  session = [
      #    {
      #      manage = "desktop";
      #      name = "plasma";
      #      start = ''
      #        export KDEWM=${pkgs.awesome}/bin/awesome
      #        export QT_QPA_PLATFORMTHEME="qt5ct"
      #
      #        exec ${pkgs.plasma-workspace}/bin/startplasma-x11
      #      '';
      #    }
      #  ];
      #};
    };
  };
}
