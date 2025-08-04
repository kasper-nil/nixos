{ ... }:
{
  services = {
    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "schedutil";
          turbo = "auto";
        };
      };
    };

    hyprpaper = {
      enable = true;
      settings = {
        preload = [
          "/etc/nixos/assets/wallpaper.png"
        ];

        wallpaper = [
          ", /etc/nixos/assets/wallpaper.png"
        ];
      };
    };
  };
}
