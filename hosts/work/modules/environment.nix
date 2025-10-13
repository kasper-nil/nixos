{ inputs, pkgs, ... }:
let
  dotnets = pkgs.dotnetCorePackages.combinePackages [
    pkgs.dotnetCorePackages.sdk_8_0
    pkgs.dotnetCorePackages.sdk_9_0
  ];
in
{
  environment = {
    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk_9}/share/dotnet";
    };

    systemPackages = with pkgs; [
      nixd
      nixfmt-rfc-style

      protonup-qt
      ffmpeg-full

      # cli tools
      ranger
      htop
      tmux
      openvpn
      fastfetch
      xwayland-run

      # software
      vscode.fhs
      libreoffice
      openrgb-with-all-plugins
      inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
      xarchiver
      qbittorrent
      wdisplays
      pamixer
      pavucontrol

      # Dotnet stuff
      dotnets
      dotnetCorePackages.runtime_9_0
      dotnetCorePackages.runtime_8_0
      roslyn-ls
      # dotnet-runtime_8
      nodejs
      corepack
      # azure-cli
      nuget
      nodePackages.pnpm
      tailwindcss

      # gaming
      prismlauncher
      lutris

      playerctl
      lact
      obsidian
      gh
      vlc
      godot

      spotify

      easyeffects
    ];
  };
}
