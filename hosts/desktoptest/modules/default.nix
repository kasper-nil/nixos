{ ... }:
{
  # imports = lib.filter (p: lib.hasSuffix ".nix" (toString p) && p != ./default.nix) (
  #   lib.filesystem.listFilesRecursive ./.
  # );

  desktop-environment.hyprland.enable = true;

  imports = [
    ./programs
    ./boot.nix
    ./console.nix
    ./environment.nix
    ./fonts.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
