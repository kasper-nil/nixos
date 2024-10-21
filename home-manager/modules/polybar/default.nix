{ inputs, pkgs, config, ... } : {

  xdg.configFile = {
    "polybar/modules.ini".source = ./modules.ini;
  };

  services.polybar = {
    enable = true;

    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  }
}