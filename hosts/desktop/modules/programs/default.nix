{ pkgs, ... }:
{
  imports = [
    ./appimage.nix
    ./nix-ld.nix
    ./steam.nix
  ];

  programs = {
    zsh = {
      enable = true;
      # Fix for running ASP.NET API with the speech SDK
      shellInit = ''
        export LD_LIBRARY_PATH="${
          pkgs.lib.makeLibraryPath [
            pkgs.util-linux
            pkgs.stdenv.cc.cc.lib
            pkgs.alsa-lib
          ]
        }:''${LD_LIBRARY_PATH:-}"
      '';
    };

    gamemode.enable = true;

  };
}
