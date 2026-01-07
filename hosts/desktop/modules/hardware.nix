{ pkgs, ... }:
{
  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;

    uinput.enable = true;

    cpu = {
      amd = {
        updateMicrocode = true;
      };
    };

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
          Experimental = true;
          FastConnectable = true;
          ControllerMode = "bredr";
        };
        Policy = {
          AutoEnable = true;
        };
      };
    };
  };
}
