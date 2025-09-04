{ pkgs, ... }:
{
  hardware = {
    enableAllFirmware = true;

    uinput.enable = true;

    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        amdvlk
      ];

      # For 32 bit applications
      enable32Bit = true; # For 32 bit applications
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
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
