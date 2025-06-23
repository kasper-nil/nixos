{ inputs, pkgs, ... }:
{
  environment = {
    sessionVariables = {
      DOTNET_ROOT = "${pkgs.dotnet-sdk}/share/dotnet";
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
      networkmanager-openvpn

      omnisharp-roslyn

      # gaming
      prismlauncher
      lutris

      playerctl

      lact
    ];
  };
}
