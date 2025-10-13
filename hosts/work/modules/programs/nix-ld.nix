{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      icu
      zlib
      libunwind
      curl
      openssl
      krb5
      stdenv.cc.cc.lib
    ];
  };
}
