{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    corepack
    pnpm
    dotnet-sdk_8
    azure-cli
    nuget
  ];

  shellHook = ''
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi

    cd ~/Documents/Work
  '';
}
