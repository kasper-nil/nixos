{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs_18
    corepack
    pnpm
  ];

  shellHook = ''
    export SHELL=${pkgs.zsh}/bin/zsh
    exec ${pkgs.zsh}/bin/zsh
  '';
}
