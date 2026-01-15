{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs
    corepack
    dotnet-sdk_10
    azure-cli
    nuget
    nodePackages.pnpm
    tailwindcss

    # Needed by Microsoft.CognitiveServices.Speech native runtime on NixOS
    openssl_1_1
    cacert
    zlib
    util-linux
    alsa-lib
    stdenv.cc.cc.lib
  ];

  shellHook = ''
    # Make sure the Speech SDK can find a trust store
    export SSL_CERT_FILE="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    export SSL_CERT_DIR="${pkgs.cacert}/etc/ssl/certs"

    # Force OpenSSL 1.1 (Speech SDK native stack may break with OpenSSL 3)
    export LD_LIBRARY_PATH="${
      pkgs.lib.makeLibraryPath [
        pkgs.openssl_1_1
        pkgs.zlib
        pkgs.util-linux
        pkgs.stdenv.cc.cc.lib
        pkgs.alsa-lib
      ]
    }:''${LD_LIBRARY_PATH:-}"

    # Usually not needed inside mkShell, but harmless; uncomment if you hit SDK lookup issues
    # export DOTNET_ROOT="${pkgs.dotnet-sdk_10}/share/dotnet"

    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      export PNPM_HOME=$HOME/.local/bin
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
