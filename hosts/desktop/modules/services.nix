{ pkgs, ... }:
{
  services = {
    openssh = {
      enable = true;
    };

    minecraft-server = {
      enable = false;
      eula = true;

      openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
      declarative = true;

      serverProperties = {
        server-port = 50000;
        difficulty = "normal";
        gamemode = 0;
        force-gamemode = true;
        max-players = 2;
        motd = "Kasper and Ivanka server";
        white-list = false;
        allow-cheats = true;
      };
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
