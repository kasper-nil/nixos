{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services = {
    displayManager = {
      defaultSession = "none+i3";
    };

    xserver = {
      enable = true;
      windowManager.i3.enable = true;
    };
  };
}
