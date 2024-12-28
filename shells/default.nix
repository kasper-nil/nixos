{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_18
    corepack_18
    jadx
  ];

  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pycrypto
    ]))
  ];

  shellHook = ''
    if [ "$SHELL" != "${pkgs.zsh}/bin/zsh" ]; then
      export SHELL=${pkgs.zsh}/bin/zsh
      exec ${pkgs.zsh}/bin/zsh
    fi
  '';
}
