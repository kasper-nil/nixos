{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    dotnet-sdk_8
  ];

  shellHook = ''
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
