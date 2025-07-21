{ lib, ... }:
{
  #imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
  #  lib.filesystem.listFilesRecursive ./.
  #);

  imports = [
    ./alacritty.nix
    ./git.nix
    ./hyprlock.nix
    ./hyprpanel.nix
    ./mangohud.nix
    ./nixcord.nix
    ./rofi.nix
    ./spicetify.nix
    ./starship.nix
    ./zsh.nix
  ];

  disabledModules = [ "./hyprpanel.nix" ];
}
