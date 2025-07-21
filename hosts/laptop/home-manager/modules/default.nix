{ lib, ... }:
{
  #imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
  #  lib.filesystem.listFilesRecursive ./.
  #);

  imports = [
    ./programs
    ./catppuccin.nix
    ./gtk.nix
    ./home.nix
    ./nixpkgs.nix
    ./qt.nix
    ./services.nix
    ./wayland.nix
  ];
}
