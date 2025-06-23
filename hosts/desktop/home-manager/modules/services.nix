{ ... }:
{
  services = {
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
