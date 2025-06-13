{ ... }:
{
  # enable Hyprland
  programs.hyprland.enable = true;

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Configure PAM to allow hyprlock to perform auth
  security.pam.services.hyprlock = { };
}
