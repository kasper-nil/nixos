{ pkgs, ... }:
{
  hardware = {
    enableAllFirmware = true;

    uinput.enable = true;

    graphics = {
      enable = true;

      # For 32 bit applications
      enable32Bit = true; # For 32 bit applications
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
