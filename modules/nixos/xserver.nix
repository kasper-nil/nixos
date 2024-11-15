{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw

  services.xserver = {
    enable = true;

    windowManager.i3.enable = true;

    displayManager = {
      defaultSession = "none+i3";
    };
  };
}
