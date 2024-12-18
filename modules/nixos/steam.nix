{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraEnv = {
        MANGOHUD = true;
        OBS_VKCAPTURE = true;
        RADV_TEX_ANISO = 16;
      };
      extraLibraries =
        p: with p; [
          atk
        ];
    };

    # Open ports in the firewall for Steam Remote Play
    remotePlay.openFirewall = true;

    # Open ports in the firewall for Source Dedicated Server
    dedicatedServer.openFirewall = true;

    # Open ports in the firewall for Steam Local Network Game Transfers
    localNetworkGameTransfers.openFirewall = true;
  };
}
