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
    };
  };
}
