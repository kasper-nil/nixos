{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    corepack
    dotnet-sdk_8
    azure-cli
    nuget
    nodePackages.pnpm
    tailwindcss
  ];

  shellHook = ''
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      export PNPM_HOME=$HOME/.local/bin
      exec ${pkgs.zsh}/bin/zsh
    fi

    cd ~/Documents/Work
  '';
}
