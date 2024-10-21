{ inputs, pkgs, config, ... } : {

  services.polybar = {
    enable = true;

    script = ''
      for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
        MONITOR=$m polybar bar &
      done
    '';

    config = ./config.ini;
  };
}