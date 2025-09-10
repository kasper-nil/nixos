{ inputs, pkgs, ... }:
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
      vscode
      libreoffice
      openrgb-with-all-plugins
      inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
      xarchiver
      qbittorrent
      wdisplays
      pamixer
      pavucontrol

      # Dotnet stuff
      dotnet-sdk_9
      dotnet-runtime_9
      # dotnet-sdk_8
      # dotnet-runtime_8
      csharpier
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
