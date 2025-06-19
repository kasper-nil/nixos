{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;

    package = pkgs.rofi-wayland;

    plugins = with pkgs; [ rofi-calc ];

    extraConfig = {
      modi = "drun,window,calc";
      show-icons = true;
      display-drun = "Apps";
      display-calc = "Calculator";
      display-run = "Run";
      display-filebrowser = "Files";
      display-window = "Windows";
      window-format = "{w} · {c} · {t}";
      drun-display-format = "{name}";

      # Keybinds
      kb-element-next = "";
      kb-mode-next = "Tab";
      kb-mode-previous = "";
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "window" = {
          transparency = "real";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          width = mkLiteral "800px";
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";

          enabled = true;
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-width = mkLiteral "1px";
          border-radius = mkLiteral "10px";
          cursor = "default";
        };

        "mainbox" = {
          enabled = true;
          spacing = mkLiteral "0px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-width = mkLiteral "0px";
          children = map mkLiteral [
            "inputbar"
            "message"
            "mode-switcher"
            "listview"
          ];
        };

        "inputbar" = {
          enabled = true;
          padding = mkLiteral "15px 20px 15px 20px";
          border = mkLiteral "0px 0px 1px 0px";
          children = map mkLiteral [
            "entry"
          ];
        };

        "prompt" = {
          enabled = true;
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
        };

        "textbox-prompt-colon" = {
          enabled = true;
          padding = mkLiteral "5px 0px";
          expand = false;
          str = "";
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
        };

        "entry" = {
          enabled = true;
          padding = mkLiteral "5px 0px";
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search...";
          # placeholder-color = mkLiteral "inherit";
        };

        "num-filtered-rows" = {
          enabled = true;
          expand = false;
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
        };

        "textbox-num-sep" = {
          enabled = true;
          expand = false;
          str = "/";
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
        };

        "num-rows" = {
          enabled = true;
          expand = false;
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
        };

        "case-indicator" = {
          enabled = true;
          # background-color = mkLiteral "inherit";
          # text-color = mkLiteral "inherit";
        };

        "listview" = {
          enabled = true;
          columns = mkLiteral "1";
          lines = mkLiteral "8";
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;

          spacing = mkLiteral "5px";
          margin = mkLiteral "0px";
          padding = mkLiteral "10px";
          border = mkLiteral "1px 0px 0px 0px";
          cursor = "default";
        };

        "scrollbar" = {
          handle-width = mkLiteral "5px";
          border-radius = mkLiteral "10px";
        };

        "element" = {
          enabled = true;
          spacing = mkLiteral "10px";
          margin = mkLiteral "0px";
          padding = mkLiteral "6px";
          border-width = mkLiteral "0px";
          border-radius = mkLiteral "6px";
          cursor = mkLiteral "pointer";
        };

        "element-icon" = {
          # text-color = mkLiteral "inherit";
          size = mkLiteral "24px";
          # cursor = mkLiteral "inherit";
        };

        "element-text" = {
          # text-color = mkLiteral "inherit";
          # highlight = mkLiteral "inherit";
          # cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        "mode-switcher" = {
          enabled = true;
          expand = false;
          spacing = mkLiteral "0px";
          margin = mkLiteral "0px";
          padding = mkLiteral "0px";
          border-width = mkLiteral "0px";
          border-radius = mkLiteral "0px";
        };

        "button" = {
          padding = mkLiteral "10px";
          border = "0px 0px 0px 1px";
          border-radius = mkLiteral "0px";
          cursor = mkLiteral "pointer";
        };

        "button selected" = {
          border-width = mkLiteral "0px";
          border-radius = mkLiteral "0px";
        };

        "message" = {
          enabled = true;
          margin = mkLiteral "0px 10px 0px";
          padding = mkLiteral "0px";
          border-width = mkLiteral "0px";
          border-radius = mkLiteral "0px 0px 0px 0px";
        };

        "textbox" = {
          padding = mkLiteral "10px";
          border-width = mkLiteral "0px";
          border-radius = mkLiteral "10px";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
          highlight = mkLiteral "none";
          blink = true;
          markup = true;
        };

        "error-message" = {
          padding = mkLiteral "10px";
          border-width = mkLiteral "2px";
          border-radius = mkLiteral "10px";
        };
      };
  };
}
