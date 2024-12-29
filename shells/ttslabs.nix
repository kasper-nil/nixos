{ pkgs }:
let
  prisma-engines-bin = (pkgs.callPackage ./binaries/prisma-engines-bin.nix { });
in
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.bashInteractive ];

  buildInputs = with pkgs; [
    nodejs_18
    corepack_18
    turbo
    prisma-engines-bin
  ];

  shellHook = ''
    export TURBO_BINARY_PATH="${pkgs.turbo}/bin/turbo"

      export PRISMA_MIGRATION_ENGINE_BINARY="${prisma-engines-bin}/bin/migration-engine"
      export PRISMA_QUERY_ENGINE_BINARY="${prisma-engines-bin}/bin/query-engine"
      export PRISMA_INTROSPECTION_ENGINE_BINARY="${prisma-engines-bin}/bin/introspection-engine"
      export PRISMA_FMT_BINARY="${prisma-engines-bin}/bin/prisma-fmt"
      export PATH="$PATH:$PWD/node_modules/.bin"

    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
