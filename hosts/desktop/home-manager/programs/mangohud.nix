{ ... }:
{
  programs.mangohud = {
    enable = false;
    enableSessionWide = true;
    settings = {
      gpu_temp = true;
      cpu_temp = true;
      frametime = true;
      toggle_hud = "Shift_R+M";
    };
  };
}
