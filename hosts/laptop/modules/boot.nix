{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_xanmod_latest;

    kernelParams = [
      "amd_pstate=passive"
    ];

    initrd = {
      kernelModules = [
        "amdgpu"
        "hid_playstation"
      ];
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
