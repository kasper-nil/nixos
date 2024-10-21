{ inputs, pkgs, config, ... } : {

  services.polybar = {
    enable = true;

    script = "polybar bar &";

    config = ./config.ini;

    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  };
}