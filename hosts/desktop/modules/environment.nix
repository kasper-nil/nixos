{ pkgs, ... }:
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
      xwayland-run
      openrgb-with-all-plugins
      qbittorrent
      pamixer
      dotnet-sdk_9
      dotnet-runtime_9
      roslyn-ls
      prismlauncher
      playerctl
      obsidian
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
      python314
      clamav
      qt6.qtdeclarative
      airshipper
    ];
  };
}
