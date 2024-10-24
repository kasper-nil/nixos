{
  inputs,
  config,
  pkgs,
  ...
}:
let
  mod = "Mod4";
  terminal = "kitty";
in
{
  home.packages = with pkgs; [
    polybar
    rofi
  ];

  services.polybar = {
    enable = false;
    config = ../../dotfiles/polybar.ini;
    script = ''
      for m in $(polybar --list-monitors | ${pkgs.coreutils}/bin/cut -d":" -f1); do
        MONITOR=$m polybar bar &
      done
    '';
  };

  programs.rofi = {
    enable = true;
  };

  home.file."${config.home.homeDirectory}/.config/rofi/launchers/default.rasi" = {
    source = ../../dotfiles/rofi/launchers/default.rasi;
  };

  home.file."${config.home.homeDirectory}/.config/rofi/launchers/shared/colors.rasi" = {
    source = ../../dotfiles/rofi/launchers/shared/colors.rasi;
  };

  home.file."${config.home.homeDirectory}/.config/rofi/launchers/shared/fonts.rasi" = {
    source = ../../dotfiles/rofi/launchers/shared/fonts.rasi;
  };

  home.file."${config.home.homeDirectory}/.config/rofi/colors/onedark.rasi" = {
    source = ../../dotfiles/rofi/colors/onedark.rasi;
  };

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
    '';

    config = {
      startup = [
        {
          command = "polybar-msg cmd quit";
          always = true;
          notification = false;
        }
        {
          command = "polybar bar";
          always = true;
          notification = false;
        }
      ];

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
          statusCommand = "i3status";
          position = "top";
        }
      ]; # use polybar instead

      keybindings = {
        "${mod}+T" = "exec ${terminal}";
        "${mod}+d" = "exec rofi -show drun -theme ${config.home.homeDirectory}/.config/rofi/launchers/default.rasi";

        # Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${mod}+Shift+r" = "restart";

        # Exit i3 (logs you out of your X session
        "${mod}+Shift+e" = "exit";

        "${mod}+r" = "mode resize";

        "${mod}+Shift+s" = "exec systemctl suspend";

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
