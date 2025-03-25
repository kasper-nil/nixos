{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.bashInteractive ];

  buildInputs = with pkgs; [
    nodejs_18
    corepack_18
  ];

  shellHook = ''
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
