{ pkgs }:
let
  overrides = (builtins.fromTOML (builtins.readFile ./rust-toolchain.toml));
  libPath =
    with pkgs;
    lib.makeLibraryPath [
      # load external libraries that you need in your rust project here
      openssl_3_3
    ];
in
pkgs.mkShell {
  packages = with pkgs; [
    nodejs
    corepack
    pnpm
    cargo
  ];

  buildInputs = with pkgs; [
    clang
    llvmPackages.bintools
    rustup
    cargo
    rustc
    at-spi2-atk
    atkmm
    cairo
    gdk-pixbuf
    glib
    gobject-introspection
    gobject-introspection.dev
    gtk3
    harfbuzz
    librsvg
    libsoup_3
    pango
    webkitgtk_4_1
    webkitgtk_4_1.dev
    pkg-config
    wget
  ];

  RUSTC_VERSION = overrides.toolchain.channel;

  # https://github.com/rust-lang/rust-bindgen#environment-variables
  LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];

  shellHook = ''
    export PATH=$PATH:''${CARGO_HOME:-~/.cargo}/bin
    export PATH=$PATH:''${RUSTUP_HOME:-~/.rustup}/toolchains/$RUSTC_VERSION-x86_64-unknown-linux-gnu/bin/
    export SHELL=${pkgs.zsh}/bin/zsh
    exec ${pkgs.zsh}/bin/zsh
  '';

  # Add precompiled library to rustc search path
  RUSTFLAGS = (
    builtins.map (a: ''-L ${a}/lib'') [
      # add libraries here (e.g. pkgs.libvmi)
    ]
  );

  LD_LIBRARY_PATH = libPath;

  # Add glibc, clang, glib, and other headers to bindgen search path
  BINDGEN_EXTRA_CLANG_ARGS =
    # Includes normal include path
    (builtins.map (a: ''-I"${a}/include"'') [
      # add dev libraries here (e.g. pkgs.libvmi.dev)
      pkgs.glibc.dev
    ])
    # Includes with special directory paths
    ++ [
      ''-I"${pkgs.llvmPackages_latest.libclang.lib}/lib/clang/${pkgs.llvmPackages_latest.libclang.version}/include"''
      ''-I"${pkgs.glib.dev}/include/glib-2.0"''
      ''-I${pkgs.glib.out}/lib/glib-2.0/include/''
    ];

  OPENSSL_NO_VENDOR = 1;
  OPENSSL_LIB_DIR = "${pkgs.lib.getLib pkgs.openssl_3}/lib";
  OPENSSL_DIR = "${pkgs.openssl_3.dev}";
  PKG_CONFIG_PATH =
    with pkgs;
    "${glib.dev}/lib/pkgconfig:${libsoup_3.dev}/lib/pkgconfig:${webkitgtk_4_1.dev}/lib/pkgconfig:${at-spi2-atk.dev}/lib/pkgconfig:${gtk3.dev}/lib/pkgconfig:${gdk-pixbuf.dev}/lib/pkgconfig:${cairo.dev}/lib/pkgconfig:${pango.dev}/lib/pkgconfig:${harfbuzz.dev}/lib/pkgconfig";
}
