{ pkgs, ... }:
{
  programs.nix-ld = {
    # nix-ld = {
    #   enable = true;
    #   libraries = with pkgs; [
    #     stdenv.cc.cc.lib
    #     zlib
    #     openssl
    #     icu
    #   ];
    # };
  };
}
