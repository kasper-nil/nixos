{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    initrd = {
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
