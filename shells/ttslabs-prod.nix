{ pkgs }:
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.bashInteractive ];

  buildInputs = with pkgs; [
    nodejs
    corepack
    turbo
  ];

  shellHook = ''
    export TURBO_BINARY_PATH="${pkgs.turbo}/bin/turbo"

    export PRISMA_QUERY_ENGINE_LIBRARY=${pkgs.prisma-engines}/lib/libquery_engine.node
    export PRISMA_QUERY_ENGINE_BINARY=${pkgs.prisma-engines}/bin/query-engine
    export PRISMA_SCHEMA_ENGINE_BINARY=${pkgs.prisma-engines}/bin/schema-engine

    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
