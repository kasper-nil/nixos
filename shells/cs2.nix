{ pkgs }:
let
  buildInputs = with pkgs; [
    dotnet-sdk_8
    roslyn-ls
  ];
in
pkgs.mkShell {
  name = "dotnet-env";
  buildInputs = buildInputs;
  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath buildInputs}
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
