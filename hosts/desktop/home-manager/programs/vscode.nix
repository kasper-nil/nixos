{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;

    package = pkgs.vscodium;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          continue.continue
          catppuccin.catppuccin-vsc
          jnoortheen.nix-ide
          dbaeumer.vscode-eslint
          prettier.prettier-vscode
        ];

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

          "continue.manuallyRunningServer" = true;
          "continue.serverUrl" = "http://localhost:11434";

          "explorer.confirmDragAndDrop" = false;
          "explorer.confirmDelete" = false;
          "explorer.compactFolders" = false;

          "typescript.updateImportsOnFileMove.enabled" = "always";

          "javascript.updateImportsOnFileMove.enabled" = "always";

          "git.confirmSync" = false;
          "git.autofetch" = true;

          "diffEditor.ignoreTrimWhitespace" = false;

          "eslint.format.enable" = true;
          "eslint.validate" = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
          ];

          # --- UI & misc preferences ---
          "telemetry.telemetryLevel" = "all";
          "telemetry.feedback.enabled" = false;

          "extensions.autoUpdate" = false;
          "extensions.ignoreRecommendations" = true;

          # Theme & icon theme — requires Catppuccin extensions installed
          "workbench.colorTheme" = "Catppuccin Mocha";
          "workbench.iconTheme" = "catppuccin-mocha";
          "workbench.enableExperiments" = false;

          # Chat features off
          "chat.agent.enabled" = false;
          "chat.commandCenter.enabled" = false;

          "remote.SSH.experimental.chat" = false;

          "codeium.enableConfig" = {
            "*" = true;
            "aspnetcorerazor" = true;
          };

          "python.analysis.typeCheckingMode" = "off";

          "qt-qml.qmlls.useQmlImportPathEnvVar" = true;

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
          "[typescript]" = {
            "editor.defaultFormatter" = "prettier.prettier-vscode";
          };
          "[typescriptreact]" = {
            "editor.defaultFormatter" = "prettier.prettier-vscode";
          };
          "[javascript]" = {
            "editor.defaultFormatter" = "prettier.prettier-vscode";
          };
          "[javascriptreact]" = {
            "editor.defaultFormatter" = "prettier.prettier-vscode";
          };
          "[css]" = {
            "editor.defaultFormatter" = "prettier.prettier-vscode";
          };
          "[xml]" = {
            "editor.defaultFormatter" = "redhat.vscode-xml";
          };
        };
      };
    };
  };
}
