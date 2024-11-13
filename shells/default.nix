{ pkgs, ... }:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    corepack
    pnpm
  ];

  shellHook = ''
    SHELL=${pkgs.zsh}
  '';
}
