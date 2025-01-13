{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    # Enable Hyprland
    wayland.windowManager.hyprland.enable = true;

    # Required for the default Hyprland config
    programs.kitty.enable = true;

    # Hint Electron apps to use Wayland:
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    # Programs don’t work in systemd services, but do on the terminal
    wayland.windowManager.hyprland.systemd.variables = [ "--all" ];
  };
}
