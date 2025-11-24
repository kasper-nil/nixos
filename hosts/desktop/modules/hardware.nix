{ pkgs, ... }:
{
  hardware = {
    enableAllFirmware = true;

    uinput.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true; # For 32 bit applications

      extraPackages = with pkgs; [
        libva-utils
        libvdpau-va-gl
      ];
    };

    keyboard = {
      zsa = {
        enable = true;
      };
    };

    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };
}
