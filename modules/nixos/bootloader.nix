{ lib, config, ... }:
{
  options = {
    bootloader.enable = lib.mkEnableOption "Enable bootloader";
  };

  config = lib.mkIf config.bootloader.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
