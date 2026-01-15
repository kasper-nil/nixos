{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      nixd
      nixfmt
      ffmpeg-full
      # dotnet-sdk_9
      # dotnet-runtime_9
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
