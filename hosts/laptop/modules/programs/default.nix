{ lib, ... }:
{
  # imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
  #   lib.filesystem.listFilesRecursive ./.
  # );

  imports = [
    ./appimage.nix
    ./hyprland.nix
    ./nix-ld.nix
    ./nm-applet.nix
    ./steam.nix
    ./thunar.nix
    ./zsh.nix
  ];
}
