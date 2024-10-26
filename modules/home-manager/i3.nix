{ config, ... }:
let
  mod = "Mod4";
  terminal = "alacritty";
  i3status-rs-config = "${config.home.homeDirectory}/.config/i3status-rust/config-default.toml";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    extraConfig = ''
      # resize window
      mode "resize" {
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt
        # back to normal
        bindsym Escape mode "default"
      }

      for_window [title="Desktop — Plasma"] kill, floating enable, border none
      for_window [class="plasmashell"] floating enable
      for_window [class="Plasma"] floating enable, border none
      for_window [title="plasma-desktop"] floating enable, border none
      for_window [title="win7"] floating enable, border none
      for_window [class="krunner"] floating enable, border none
      for_window [class="Kmix"] floating enable, border none
      for_window [class="Klipper"] floating enable, border none
      for_window [class="Plasmoidviewer"] floating enable, border none
      for_window [class="(?i)*nextcloud*"] floating disable
      for_window [class="plasmashell" window_type="notification"] floating enable, border none, move right 700px, move down 450px
      no_focus [class="plasmashell" window_type="notification"]
    '';

    config = {
      modifier = "${mod}";

      window = {
        titlebar = false;
        border = 2;
        commands = [
          {
            command = "border pixel 2";
            criteria = {
              class = "^.*";
            };
          }
        ];
      };

      gaps = {
        smartBorders = "on";
        smartGaps = true;
        inner = 10;
        outer = 0;
      };

      bars = [
        {
          fonts = {
            names = [
              "DejaVu Sans Mono"
              "FontAwesome6Free"
            ];
            size = 12.0;
          };
          statusCommand = "i3status-rs ${i3status-rs-config}";
          position = "top";
        }
      ];

      keybindings = {
        "${mod}+T" = "exec --no-startup-id ${terminal}";
        "${mod}+d" = "exec --no-startup-id rofi -show drun -show-icons";

        # Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${mod}+Shift+r" = "restart";

        # Exit i3 (logs you out of your X session
        "${mod}+Shift+e" = "exit";

        "${mod}+r" = "mode resize";

        "${mod}+Shift+s" = "exec --no-startup-id systemctl suspend";

        # Change focus
        "${mod}+Left" = "focus left";
        "${mod}+Down" = "focus down";
        "${mod}+Up" = "focus up";
        "${mod}+Right" = "focus right";

        # Move focused window
        "${mod}+Shift+Left" = "move left";
        "${mod}+Shift+Down" = "move down";
        "${mod}+Shift+Up" = "move up";
        "${mod}+Shift+Right" = "move right";

        # Enter fullscreen mode for the focused container
        "${mod}+f" = "fullscreen toggle";

        # Kill focused window
        "${mod}+q" = "kill";

        # Pulse Audio controls
        # increase sound volume
        "XF86AudioRaiseVolume" = "exec --no-startup-id amixer -q set Master 5%+ unmute";
        # decrease sound volume
        "XF86AudioLowerVolume" = "exec --no-startup-id amixer -q set Master 5%- unmute";
        # mute sound
        "XF86AudioMute" = "exec --no-startup-id amixer -q set Master toggle";

        # Switch to workspace
        "${mod}+1" = "workspace 1";
        "${mod}+2" = "workspace 2";
        "${mod}+3" = "workspace 3";
        "${mod}+4" = "workspace 4";
        "${mod}+5" = "workspace 5";
        "${mod}+6" = "workspace 6";
        "${mod}+7" = "workspace 7";
        "${mod}+8" = "workspace 8";
        "${mod}+9" = "workspace 9";
        "${mod}+0" = "workspace 10";

        # Move focused container to workspace
        "${mod}+Shift+1" = "move container to workspace 1";
        "${mod}+Shift+2" = "move container to workspace 2";
        "${mod}+Shift+3" = "move container to workspace 3";
        "${mod}+Shift+4" = "move container to workspace 4";
        "${mod}+Shift+5" = "move container to workspace 5";
        "${mod}+Shift+6" = "move container to workspace 6";
        "${mod}+Shift+7" = "move container to workspace 7";
        "${mod}+Shift+8" = "move container to workspace 8";
        "${mod}+Shift+9" = "move container to workspace 9";
        "${mod}+Shift+0" = "move container to workspace 10";
      };
    };
  };
}
