{ ... }:
let
  # Keep old-pkgs if you still need it for nodejs and corepack versions
  pkgs =
    import
      (fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/21808d22b1cda1898b71cf1a1beb524a97add2c4.tar.gz";
        sha256 = "0v2z6jphhbk1ik7fqhlfnihcyff5np9wb3pv19j9qb9mpildx0cg";
      })
      {
        system = builtins.currentSystem or "x86_64-linux";
      };

  # Define the FHS environment
  electronFHS = pkgs.buildFHSEnv {
    name = "electron-env";
    targetPkgs =
      pkgs: with pkgs; [
        atk
        cairo
        cups
        dbus
        expat
        glib
        glibc
        gobject-introspection
        gtk3
        libdrm
        nspr
        nss
        pango
        # stdenv.cc.lib
        xorg.libX11
        xorg.libxcb # Corrected: use pkgs.xorg.libxcb
        libxkbcommon # Corrected: use pkgs.xorg.libxkbcommon
        xorg.libXcomposite
        xorg.libXdamage
        xorg.libXext
        xorg.libXfixes
        xorg.libXrandr
        mesa
        alsa-lib
        zlib
        libgbm
        libglvnd # Provides OpenGL dispatch
        vulkan-loader # Provides Vulkan loader
        nodejs-18_x
        corepack_18
        udev
      ];

    runScript = ''
      # This script will be executed when you enter the FHS environment
      echo "Entering Electron FHS environment..."

      export PRISMA_QUERY_ENGINE_LIBRARY=${pkgs.prisma-engines}/lib/libquery_engine.node
      export PRISMA_QUERY_ENGINE_BINARY=${pkgs.prisma-engines}/bin/query-engine
      export PRISMA_SCHEMA_ENGINE_BINARY=${pkgs.prisma-engines}/bin/schema-engine

      if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
        export SHELL=${pkgs.zsh}/bin/zsh
        exec ${pkgs.zsh}/bin/zsh
      fi
    '';
  };

in

pkgs.mkShell {
  # We only need the FHS environment script in this shell
  nativeBuildInputs = [ electronFHS ];

  # The shellHook will just launch the FHS environment
  shellHook = ''
    echo "Launching Electron FHS environment..."
    exec ${electronFHS}/bin/electron-env # Execute the FHS environment script
  '';
}
