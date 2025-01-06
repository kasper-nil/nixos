{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    fonts.enable = lib.mkEnableOption "Enable fonts";
  };

  config = lib.mkIf config.fonts.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk-sans
    ];
  };
}
