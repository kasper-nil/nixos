{ pkgs, ... }:
{
  services = {
    udev = {
      packages = with pkgs; [
        game-devices-udev-rules
        zsa-udev-rules
      ];
    };

    input-remapper = {
      enable = true;
    };

    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    flatpak = {
      enable = true;
    };

    # ollama = {
    #   enable = true;
    #   package = pkgs.ollama-rocm;

    #   host = "127.0.0.1";
    #   port = 11434;
    #   openFirewall = true;
    # };

    # open-webui = {
    #   enable = true;
    #   host = "127.0.0.1";
    #   port = 11435;

    #   environment = {
    #     # Tell Open WebUI how to reach Ollama
    #     OLLAMA_BASE_URL = "http://127.0.0.1:11434";

    #     # Optional privacy defaults (module already sets similar ones)
    #     ANONYMIZED_TELEMETRY = "False";
    #     DO_NOT_TRACK = "True";
    #     SCARF_NO_ANALYTICS = "True";

    #     # Optional: skip login/account screen (only if you trust your machine/network)
    #     WEBUI_AUTH = "False";
    #   };
    # };

    xserver = {
      enable = true;

      videoDrivers = [ "amdgpu" ];

      xkb = {
        layout = "no";
        variant = "nodeadkeys";
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
  };
}
