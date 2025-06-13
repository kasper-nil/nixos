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
    ./zsh.nix
    ./pipewire.nix
    ./steam.nix
    ./hyprland.nix
    # Minecraft
    ./minecraft/server.nix
  ];
}
