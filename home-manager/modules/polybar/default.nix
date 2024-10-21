{ inputs, pkgs, config, ... } : {

  xdg.configFile = {
    "polybar/bars.ini".source = ./bars.ini;
  };

  services.polybar = {
    enable = true;

    script = "polybar laptop &";

    config = ./config.ini;

    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  };
}