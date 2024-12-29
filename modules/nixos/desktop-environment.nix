{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    xfce.xfce4-panel
    xfce.xfce4-pulseaudio-plugin
    krohnkite
  ];

  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services = {
    # displayManager = {
    #   defaultSession = "xfce+i3";
    # };

    displayManager = {
      sddm.enable = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };

    xserver = {
      enable = true;

      # videoDrivers = [ "modesetting" ];

      #desktopManager = {
      #  xterm = {
      #    enable = false;
      #  };
      #  xfce = {
      #    enable = true;
      #    noDesktop = true;
      #    enableXfwm = false;
      #  };
      #};
      #
      #windowManager = {
      #  i3 = {
      #    enable = true;
      #    package = pkgs.i3-gaps;
      #  };
      #};
    };
  };
}
