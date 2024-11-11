{ config, ... }:
let
  mod = "Mod4";
  terminal = "alacritty";
in
{
  xsession.windowManager.i3 = {
    enable = true;

    extraConfig = ''
      # Start the compositor daemonizing it (-b) and enabling shadows (-c)
      exec_always --no-startup-id picom -cb

      # Set the desktop background
      exec_always --no-startup-id feh --bg-scale /etc/nixos/assets/backgrounds/road.jpeg

      for_window [window_role="pop-up"] floating enable

      for_window [window_role="task_dialog"] floating enable

      for_window [class="systemsettings"] floating enable

      for_window [class="plasmashell"] floating enable

      for_window [class="krunner"] floating enable
      for_window [class="krunner"] border none

      for_window [class="Kmix"] floating enable
      for_window [class="Kmix"] border none

      for_window [class="Klipper"] floating enable;
      for_window [class="Klipper"] border none

      for_window [class="Plasmoidviewer"] floating enable
      for_window [class="Plasmoidviewer"] border none

      for_window [class="Plasma"] floating enable
      for_window [class="Plasma"] border none

      for_window [title="plasma-desktop"] floating enable
      for_window [title="plasma-desktop"] border none

      for_window [class="plasmashell" window_type="notification"] border none
      for_window [class="plasmashell" window_type="notification"] move position 80 ppt 10 ppt

      # no_focus [class="plasmashell" window_type="notification"]
      no_focus [class="plasmashell"]

      # Set other stuff as floating
      # for_window [class="(?i)*nextcloud*"] floating disable
      for_window [class="(?i)nextcloud"] floating disable

      # Kill the Plasma desktop view
      # exec_always --no-startup-id wmctrl -c Plasma
      for_window [title="Desktop — Plasma"] kill; floating enable; border none
      for_window [title="Desktop @ QRect"] kill; floating enable; border none
    '';

    config = {
      modifier = "${mod}";

      window = {
        titlebar = true;
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
        inner = 8;
        outer = 0;
      };

      bars = [ ];

      keybindings = {
        # Launch terminal
        "${mod}+t" = "exec --no-startup-id ${terminal}";

        # Launch rofi
        # "${mod}+d" = "exec --no-startup-id ${rofi} -show drun -show-icons";

        # Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${mod}+Shift+r" = "restart";

        # Using plasma's logout screen instead of i3's
        "${mod}+Shift+e" = "exec --no-startup-id qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1";

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

        # Media keys
        "XF86AudioRaiseVolume" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'increase_volume'";
        "XF86AudioLowerVolume" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'decrease_volume'";
        "XF86AudioMute" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'mute'";
        "XF86AudioMicMute" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'mic_mute'";
        "Shift+XF86AudioMicMute" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut 'mic_unmute'";

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
