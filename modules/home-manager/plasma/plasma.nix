{ pkgs, config, ... }:
{
  home.file = {
    # Compositor
    "${config.home.homeDirectory}/.config/kwinrc" = {
      source = ../../dotfiles/kde/kwinrc;
    };

    # Global shortcuts
    # "${config.home.homeDirectory}/.config/kglobalshortcutsrc" = {
    #   source = ../../dotfiles/kde/kglobalshortcutsrc;
    # };

    # Custom shortcuts
    "${config.home.homeDirectory}/.config/khotkeysrc" = {
      source = ../../dotfiles/kde/khotkeysrc;
    };

    # KWin shortcuts
    "${config.home.homeDirectory}/.config/kwinshortcutsrc" = {
      source = ../../dotfiles/kde/kwinshortcutsrc;
    };
  };

  # Setup systemd services
  systemd.user = {
    sessionVariables = {
      KDEWM = "${pkgs.i3}/bin/i3";
    };
    services = {
      # Create a custom service to use i3wm
      # plasma-i3_x11 = {
      #   Install = {
      #     WantedBy = [ "plasma-workspace.target" ];
      #   };
      #   Unit = {
      #     Description = "KDE Plasma with i3wm";
      #     Before = [ "plasma-workspace.target" ];
      #   };
      #   Service = {
      #     ExecStart = ''
      #       ${pkgs.i3}/bin/i3
      #     '';
      #     Slice = "session.slice";
      #     Restart = "on-failure";
      #   };
      # };
      plasma-i3_x11 = {
        Install = {
          WantedBy = [ "plasma-workspace.target" ];
        };
        Unit = {
          Description = "KDE Plasma with i3wm";
          Wants = "plasma-kcminit.service";
          PartOf = "graphical-session.target";
        };
        Service = {
          ExecStart = ''${pkgs.i3}/bin/i3'';
          Slice = "session.slice";
          Restart = "on-failure";
        };
      };
    };
  };
}
