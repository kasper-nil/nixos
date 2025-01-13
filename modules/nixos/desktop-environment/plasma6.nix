{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    plasma6.enable = lib.mkEnableOption "Enable plasma 6";
  };

  config = lib.mkIf config.plasma6.enable {
    environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
    ];

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services = {
      displayManager = {
        sddm.enable = true;
      };

      desktopManager = {
        plasma6.enable = true;
      };

      xserver = {
        enable = true;
      };
    };
  };

}
