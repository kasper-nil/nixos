{ ... }:
{
  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        userSettings = {

          "editor.formatOnSave" = true;
          "editor.detectIndentation" = false;
          "editor.acceptSuggestionOnCommitCharacter" = false;
          "editor.mouseWheelZoom" = true;

          "nix.serverPath" = "nixd";
          "nix.enableLanguageServer" = true;

          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                "command" = [ "nixfmt" ];
              };
            };
            "nixd" = {
              "formatting" = {
                "command" = [ "nixfmt" ];
              };
              "options" = {
                "nixos" = {
                  "expr" = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options";
                };
                "home-manager" = {
                  "expr" =
                    "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.desktop.options.home-manager.users.type.getSubOptions []";
                };
              };
            };
          };

          "files.associations" = {
            "**/.i3/config" = "i3";
            "**/i3/config" = "i3";
            "i3" = "i3";
            ".env*" = "dotenv";
            "*.cfg" = "ini";
            "*.cnf" = "ini";
            "*.conf" = "ini";
            "*.config" = "ini";
          };
          "files.autoSave" = "afterDelay";
          "files.exclude" = {
            "**/.git" = false;
          };

          "explorer.confirmDragAndDrop" = false;
          "explorer.confirmDelete" = false;
          "explorer.compactFolders" = false;

          "typescript.updateImportsOnFileMove.enabled" = "always";
          "javascript.updateImportsOnFileMove.enabled" = "always";
          "git.confirmSync" = false;
          "git.autofetch" = true;
          "diffEditor.ignoreTrimWhitespace" = false;

          # --- Language-specific formatters ---
          "[csharp]" = {
            "editor.defaultFormatter" = "JetBrains.resharper-code";
            "editor.formatOnSave" = true;
          };
          "[razor]" = {
            "editor.defaultFormatter" = "JetBrains.resharper-code";
            "editor.formatOnSave" = true;
          };
          "[aspnetcorerazor]" = {
            "editor.defaultFormatter" = "JetBrains.resharper-code";
            "editor.formatOnSave" = true;
          };
          "[nix]" = {
            "editor.defaultFormatter" = "jnoortheen.nix-ide";
          };
          "[vue]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[typescript]" = {
            "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
          };
          "[typescriptreact]" = {
            "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
          };
          "[javascriptreact]" = {
            "editor.defaultFormatter" = "dbaeumer.vscode-eslint";
          };
          "[json]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[jsonc]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[markdown]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[yaml]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[dockercompose]" = {
            "editor.defaultFormatter" = "esbenp.prettier-vscode";
          };
          "[css]" = {
            "editor.defaultFormatter" = "vscode.css-language-features";
          };
          "[xml]" = {
            "editor.defaultFormatter" = "redhat.vscode-xml";
          };

          # --- Prettier off for C#/Razor ---
          "prettier.disableLanguages" = [
            "csharp"
            "razor"
            "aspnetcorerazor"
          ];

          # --- UI & misc preferences ---
          "telemetry.telemetryLevel" = "off";
          "telemetry.feedback.enabled" = false;
          "workbench.enableExperiments" = false;
          "extensions.autoUpdate" = false;
          "extensions.ignoreRecommendations" = true;

          # Theme & icon theme — requires Catppuccin extensions installed
          "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.iconTheme" = "catppuccin-mocha";

          # Chat features off
          "chat.agent.enabled" = false;
          "chat.commandCenter.enabled" = false;
          "remote.SSH.experimental.chat" = false;

          "codeium.enableConfig" = {
            "*" = true;
            "aspnetcorerazor" = true;
          };
        };
      };
    };
  };
}
