let
  pkgs = import <nixpkgs> { };
in
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    gobject-introspection

    rustc
    cargo
    rust-analyzer

    cargo-tauri
    nodejs

    # Important for Tauri on NixOS:
    glib
    glib-networking
    wrapGAppsHook4
  ];

  buildInputs = with pkgs; [
    # WebKit / GTK stack
    gtk3
    webkitgtk_4_1
    at-spi2-atk
    atkmm
    cairo
    gdk-pixbuf
    glib
    harfbuzz
    librsvg
    libsoup_3
    pango
    openssl
  ];

  shellHook = ''
    export RUST_BACKTRACE=1

    export GDK_BACKEND=x11

    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
