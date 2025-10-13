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
      ranger
      htop
      tmux
      openvpn
      fastfetch
      xwayland-run
      #vscode
      libreoffice
      openrgb-with-all-plugins
      inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin
      xarchiver
      qbittorrent
      wdisplays
      pamixer
      pavucontrol
      dotnet-sdk_9
      dotnet-runtime_9
      roslyn-ls
      # gaming
      prismlauncher
      lutris
      playerctl
      lact
      obsidian
      gh
      vlc
      godot
      logmein-hamachi
      easyeffects
      steamcmd
      woeusb-ng
      ntfs3g
      go
      gopls
      keymapp

      nodejs
      corepack
      turbo
    ];
  };
}
