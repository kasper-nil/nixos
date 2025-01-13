{ ... }:
{
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./fonts.nix
    ./amd-graphics.nix
    ./i18n.nix
    ./keyboard.nix
    ./networking.nix
    ./power-profiles.nix
    ./printing.nix
    ./zsh.nix
    ./pipewire.nix
    ./steam.nix
    ./docker.nix
    ./desktop-environment/plasma6.nix
  ];
}
