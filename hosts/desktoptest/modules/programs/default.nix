{ lib, ... }:
{
  # imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
  #   lib.filesystem.listFilesRecursive ./.
  # );

  imports = [
    ./appimage.nix
    ./nix-ld.nix
    ./nm-applet.nix
    ./steam.nix
    ./zsh.nix
  ];
}
