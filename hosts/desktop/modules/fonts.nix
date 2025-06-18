{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    # noto-fonts
    # noto-fonts-emoji
    # noto-fonts-cjk-sans
    # font-awesome
    # meslo-lgs-nf
  ];
}
