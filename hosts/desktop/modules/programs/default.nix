{ pkgs, ... }:
{
  imports = [
    ./nix-ld.nix
    ./steam.nix
  ];

  programs = {
    zsh = {
      enable = true;
    };

    gamemode.enable = true;
  };
}
