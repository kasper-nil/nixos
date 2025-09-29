{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    kernelParams = [
      "amd_pstate=guided"
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
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
