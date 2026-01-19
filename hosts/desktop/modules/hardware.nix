{ ... }:
{
  hardware = {
    enableAllFirmware = true;

    uinput.enable = true;

    cpu = {
      amd = {
        updateMicrocode = true;
      };
    };

    amdgpu = {
      opencl.enable = true;
    };

    graphics = {
      enable = true;
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
