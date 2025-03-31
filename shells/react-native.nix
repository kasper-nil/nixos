{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_18
    corepack_18
    watchman
    jdk
    eas-cli
    android-studio-full
  ];

  shellHook = ''
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
