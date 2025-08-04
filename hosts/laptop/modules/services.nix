{ pkgs, ... }:
{
  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "schedutil";
          turbo = "auto";
        };
      };
    };

    udev = {
      packages = with pkgs; [
        game-devices-udev-rules
      ];
    };

    input-remapper = {
      enable = true;
    };

    openssh = {
      enable = true;
    };

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    xserver = {
      enable = true;

      videoDrivers = [ "amdgpu" ];

      xkb = {
        layout = "no";
        variant = "nodeadkeys";
      };
    };

    displayManager = {
      enable = true;
      sddm = {
        enable = true;
        package = pkgs.kdePackages.sddm;
      };
    };

    hardware = {
      openrgb.enable = true;
    };

    pipewire = {
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

    blueman = {
      enable = true;
    };
  };
}
