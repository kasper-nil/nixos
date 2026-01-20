{ pkgs, ... }:
{
  environment = {
    sessionVariables = {
    };

    systemPackages = with pkgs; [
      (
        with dotnetCorePackages;
        combinePackages [
          sdk_9_0
          sdk_10_0
        ]
      )
      nixd
      nixfmt
      ffmpeg-full
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
