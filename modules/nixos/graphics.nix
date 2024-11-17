{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dxvk
    vulkan-tools
  ];

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vulkan-loader
      intel-media-driver
    ];
  };
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
