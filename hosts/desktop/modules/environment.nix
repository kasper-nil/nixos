{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      nixd
      nixfmt
      ffmpeg-full
      dotnet-sdk_10
      dotnet-runtime_10
      roslyn-ls
      steamcmd
      rocmPackages.rocm-runtime
      rocmPackages.rocm-smi

      keymapp
      prismlauncher
      obsidian
      godot
      logmein-hamachi
      airshipper
      easyeffects
      protonup-qt
      openrgb-with-all-plugins
      postman
    ];
  };
}
