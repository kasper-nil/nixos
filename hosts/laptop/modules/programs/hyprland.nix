{ ... }:
{
  programs.hyprland = {
    enable = true;
    extraConfig = ''
      misc  { vfr = true }        # variable frame-rate
      decoration {
        blur { enabled = false }
        drop_shadow = false
      }
    '';
  };
}
