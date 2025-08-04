{ ... }:
{
  wayland = {
    windowManager = {
      hyprland = {
        enable = true;

        systemd.variables = [ "all" ];

        settings = {
          # Improve this so that each host can specify its monitor
          # "monitor" = [
          #   # Main
          #   "DP-8, 2560x1440@75, auto, 1"
          #   # Vertical
          #   "DP-7, 2560x1440@75, auto, 1, transform, 1"
          #   # Laptop
          #   "eDP-1, preferred, auto, 1"
          # ];

          "monitor" = "DP-2, 2560x1440@165, auto, 1";

          "$mod" = "SUPER";

          "$terminal" = "alacritty";
          "$fileManager" = "thunar";
          "$menu" = "rofi -show drun";
          "$lock" = "hyprlock";

          exec-once = [
            "hyprpanel"
            "hyprpaper"
            "nm-applet --indicator"
            "dbus-update-activation-environment --systemd --all"
          ];

          exec = [
            "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
          ];

          bind = [
            ", Print, exec, grimblast copy area"

            "$mod, T, exec, $terminal"
            "$mod, Q, killactive,"
            "$mod, V, togglefloating,"
            "$mod, D, exec, $menu"
            "$mod, L, exec, $lock"

            "$mod, F, fullscreen"
            "$mod, Tab, cyclenext,"
            "$mod, Tab, bringactivetotop,"
            "$mod SHIFT, P, exec, hyprctl dispatch pin"

            # Move focus with mainMod + arrow keys
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"

            "$mod SHIFT, s, exec, hyprshot -m region --clipboard-only"

            "$mod SHIFT, c, exec, hyprpicker"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (
              builtins.genList (
                i:
                let
                  ws = i + 1;
                in
                [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              ) 9
            )
          );

          bindm = [
            "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
          ];

          bindel = [
            ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
            ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
            ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, ddcutil setvcp --noverify --skip-ddc-checks 10 + 10"
            ",XF86MonBrightnessDown, exec, ddcutil setvcp --noverify --skip-ddc-checks 10 - 10"
          ];

          bindl = [
            ", XF86AudioNext, exec, playerctl next"
            ", XF86AudioPause, exec, playerctl play-pause"
            ", XF86AudioPlay, exec, playerctl play-pause"
            ", XF86AudioPrev, exec, playerctl previous"
          ];

          workspace = [
            "11, monitor:eDP-1"
            "10, monitor:DP-7"
            "1, monitor:DP-8"
            "2, monitor:DP-8"
            "3, monitor:DP-8"
            "4, monitor:DP-8"
            "5, monitor:DP-8"
            "6, monitor:DP-8"
            "7, monitor:DP-8"
            "8, monitor:DP-8"
            "9, monitor:DP-8"
          ];

          general = {
            gaps_in = 5;
            gaps_out = "0, 10, 10, 10";
            "col.active_border" = "rgba(b4befeff)";
            "col.inactive_border" = "rgba(595959aa)";
            resize_on_border = false;
            allow_tearing = false;
            layout = "dwindle";
          };

          decoration = {
            rounding = 10;
            rounding_power = 2;
            active_opacity = 1.0;
            inactive_opacity = 1.0;

            shadow = {
              enabled = true;
              range = 4;
              render_power = 3;
              color = "rgba(1a1a1aee)";
            };

            blur = {
              enabled = false;
              size = 3;
              passes = 1;
              vibrancy = 0.1696;
            };
          };

          animations = {
            enabled = true;

            bezier = [
              "easeOutQuint,0.23,1,0.32,1"
              "easeInOutCubic,0.65,0.05,0.36,1"
              "linear,0,0,1,1"
              "almostLinear,0.5,0.5,0.75,1.0"
              "quick,0.15,0,0.1,1"
            ];

            animation = [
              "global, 1, 10, default"
              "border, 1, 5.39, easeOutQuint"
              "windows, 1, 4.79, easeOutQuint"
              "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
              "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
              "windowsOut, 1, 1.49, linear, popin 87%"
              "fadeIn, 1, 1.73, almostLinear"
              "fadeOut, 1, 1.46, almostLinear"
              "fade, 1, 3.03, quick"
              "layers, 1, 3.81, easeOutQuint"
              "layersIn, 1, 4, easeOutQuint, fade"
              "layersOut, 1, 1.5, linear, fade"
              "fadeLayersIn, 1, 1.79, almostLinear"
              "fadeLayersOut, 1, 1.39, almostLinear"
              "workspaces, 1, 1.94, almostLinear, fade"
              "workspacesIn, 1, 1.21, almostLinear, fade"
              "workspacesOut, 1, 1.94, almostLinear, fade"
            ];
          };

          dwindle = {
            pseudotile = true;
            preserve_split = true;
          };

          master = {
            new_status = "master";
          };

          misc = {
            force_default_wallpaper = -1;
            disable_hyprland_logo = true;
            vfr = true;
          };

          input = {
            kb_layout = "no";
            kb_variant = "nodeadkeys";

            follow_mouse = 1;

            force_no_accel = 0;

            sensitivity = 0.35;

            touchpad = {
              natural_scroll = false;
            };
          };

          gestures = {
            workspace_swipe = false;
          };

          windowrule = [
            "suppressevent maximize, class:.*"
            "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
          ];

          windowrulev2 = [
            # Attempt on fixing Awakened Trade Macro overlay
            # "tag +poe, title:(Path of Exile)"
            # "tag +poe, class:(steam_app_238960)"
            # "float, tag:poe"

            # "tag +apt, title:(Awakened PoE Trade)"
            # "float, tag:apt "
            # "noblur, tag:apt"
            # "nofocus, tag:apt # Disable auto-focus"
            # "noshadow, tag:apt"
            # "noborder, tag:apt"
            # "pin, tag:apt"
            # "renderunfocused, tag:apt"
            # "size 100% 100%, tag:apt"
            # "center, tag:apt"
          ];
        };
      };
    };
  };
}
