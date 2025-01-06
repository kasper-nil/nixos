{ lib, config, ... }:
{
  options = {
    keyboard.enable = lib.mkEnableOption "Enable keyboard";
  };

  config = lib.mkIf config.keyboard.enable {
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "no";
      variant = "nodeadkeys";
    };

    # Configure console keymap
    console.keyMap = "no";
  };
}
