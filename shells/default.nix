{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    corepack
    pnpm
  ];

  shellHook = ''
    export SHELL=${pkgs.zsh}/bin/zsh
    exec ${pkgs.zsh}/bin/zsh
  '';
}
