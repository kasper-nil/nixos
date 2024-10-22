{ 
  inputs,
  config, 
  pkgs, 
  ... 
} : let
  mod = "Mod4";
  terminal = "kitty";
in {
  home = {
    packages = with pkgs; [
      rofi
    ]

    file = {
      ".config/i3/config".source = ./dotfiles/i3
    };
  };

  services.polybar = {
    enable = true;

    script = ''
      for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
        MONITOR=$m polybar bar &
      done
    '';

    config = ./dotfiles/polybar-config.ini;
  };
}
