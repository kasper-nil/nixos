{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true; # enable Hyprland

    environment.systemPackages = [
      # ... other packages
      pkgs.kitty # required for the default Hyprland config
    ];

    # Optional, hint Electron apps to use Wayland:
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
