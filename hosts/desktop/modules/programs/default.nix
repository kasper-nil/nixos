{ ... }:
{
  imports = [
    ./steam.nix
  ];

  programs = {
    zsh = {
      enable = true;
    };

    gamemode.enable = true;
  };
}
