{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    fira-code-nerdfont
    font-awesome_6
    font-awesome
    jetbrains-mono
    material-icons
    nerdfonts
    feather
  ];
}
