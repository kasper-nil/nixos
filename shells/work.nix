{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    corepack
    pnpm
    dotnet-aspnetcore_8
    (azure-cli.withExtensions [ azure-cli.extensions.aks-preview ])
  ];

  shellHook = ''
    export SHELL=${pkgs.zsh}/bin/zsh
    exec ${pkgs.zsh}/bin/zsh
  '';
}
