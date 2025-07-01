{ ... }:
{
  programs.mangohud = {
    enable = true; # pulls the package
    enableSessionWide = true; # set true for “always on”
    settings = {
      # written to ~/.config/MangoHud/MangoHud.conf
      gpu_temp = true;
      cpu_temp = true;
      frametime = true;
      toggle_hud = "Shift_R+M";
    };
  };
}
