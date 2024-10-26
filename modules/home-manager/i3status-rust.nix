{ pkgs, ... }:
{
  home.packages = with pkgs; [ i3status-rust ];

  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        blocks = [
          {
            alert = 10.0;
            block = "disk_space";
            info_type = "available";
            interval = 60;
            path = "/";
            warning = 20.0;
          }
          { block = "net"; }
          {
            block = "cpu";
            interval = 1;
          }
          { block = "sound"; }
          {
            block = "battery";
            format = " $icon $percentage ";
            full_format = " $icon $percentage ";
            empty_format = " $icon $percentage ";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
        settings = {
          theme = {
            theme = "gruvbox-dark";
            overrides = {

            };
          };
        };
        icons = "awesome6";
        theme = "gruvbox-dark";
      };
    };
  };
}
