{ pkgs, ... }:
{
  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";

    packages = with pkgs; [
      gearlever
    ];

    sessionVariables = {
      LIBVA_DRIVER_NAME = "radeonsi";
      MOZ_DISABLE_RDD_SANDBOX = "1";
      MOZ_ENABLE_WAYLAND = "1";
      MOZ_DRM_DEVICE = "/dev/dri/renderD128";
    };
  };
}
