{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./tofi.nix
    ./waybar.nix
    ./theme.nix
    ./hyprlock.nix
  ];

  options = {
    hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = lib.mkIf config.hyprland.enable {
    home.packages = with pkgs; [
      nwg-displays
      grimblast
      hyprpicker
      hypridle
      hyprsunset
      pavucontrol
      wireplumber
      libgtop
      bluez
      bluez-tools
      networkmanager
      dart-sass
      wl-clipboard
      upower
      gvfs
      btop
      pywal
      hyprpolkitagent
      hyprlock
    ];

    # Hint Electron apps to use Wayland:
    home.sessionVariables.NIXOS_OZONE_WL = "1";

    wayland.windowManager.hyprland = {
      # Enable Hyprland
      enable = true;

      # Package to use
      package = pkgs.hyprland;

      # Enable XWayland
      xwayland.enable = true;

      # Enable systemd
      systemd = {
        enable = true;
        variables = [ "--all" ];
      };

      # Settings
      settings = {
        "$mod" = "SUPER";
        "$drun" = "tofi-drun --drun-launch=true";

        exec-once = [
          "hyprpanel"
          "systemctl --user start hyprpolkitagent"
        ];

        input = {
          kb_layout = "no";
        };

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        bind =
          [
            # Apps
            "$mod SHIFT, S, exec, grimblast copy area"
            "$mod SHIFT, C, exec, hyprpicker"
            "$mod, D, exec, $drun"
            "$mod, T, exec, alacritty"

            # Window management
            "$mod, Q, killactive"
            "$mod, F, fullscreen"
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
      };
    };
  };
}
