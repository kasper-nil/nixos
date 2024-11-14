{ pkgs }:
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    corepack
    pnpm
    dotnet-aspnetcore_8
    azure-cli
  ];

  shellHook = ''
    export SHELL=${pkgs.zsh}/bin/zsh
    exec ${pkgs.zsh}/bin/zsh
  '';
}
