{ ... }:
{
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    audio.enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = false;

    wireplumber.enable = true;

    extraConfig.pipewire."context.modules" = [
      {
        name = "libpipewire-module-bluez5";
        args = {
          "bluez5.auto-connect" = [
            "a2dp_sink"
            "hfp_hf"
          ];
          "bluez5.enable-hw-volume" = true;
          "bluez5.profile" = "a2dp-sink";
        };
      }
    ];
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true; # Optional: GUI for Bluetooth control
}
