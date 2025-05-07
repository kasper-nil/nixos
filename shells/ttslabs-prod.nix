{ pkgs }:
let
  old-pkgs =
    import
      (fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/21808d22b1cda1898b71cf1a1beb524a97add2c4.tar.gz";
        sha256 = "0v2z6jphhbk1ik7fqhlfnihcyff5np9wb3pv19j9qb9mpildx0cg";
      })
      {
        system = builtins.currentSystem or "x86_64-linux"; # fallback for older versions
      };
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    bashInteractive
    old-pkgs.nodejs-18_x
    old-pkgs.corepack_18
    glib
    glibc
    gobject-introspection
    nss
    libnss-mysql
    libnss_nis
  ];

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.glib.out}/lib:${pkgs.nss.lib}
    export PRISMA_QUERY_ENGINE_LIBRARY=${pkgs.prisma-engines}/lib/libquery_engine.node
    export PRISMA_QUERY_ENGINE_BINARY=${pkgs.prisma-engines}/bin/query-engine
    export PRISMA_SCHEMA_ENGINE_BINARY=${pkgs.prisma-engines}/bin/schema-engine

    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
