{ lib, ... }:
{
  imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
    lib.filesystem.listFilesRecursive ./.
  );
}
