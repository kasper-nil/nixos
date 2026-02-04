{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages;

    kernelParams = [
      "amd_pstate=active"
      "split_lock_detect=off"
    ];

    initrd = {
      kernelModules = [
        "amdgpu"
        "hid_playstation"
      ];
    };

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };

      timeout = 2;

      efi.canTouchEfiVariables = true;
    };
  };
}
