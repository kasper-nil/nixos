{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    starship
  ];

  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;

    syntaxHighlighting.enable = true;

    shellAliases = {
      # NixOS
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#default";
      collect-garbage = "sudo nix-collect-garbage -d";
      configure = "code /etc/nixos";

      # Nix shells
      dev = "nix develop /etc/nixos#default";
      dev-tauri = "nix develop /etc/nixos#tauri --impure";
      dev-work = "nix develop /etc/nixos#work";
    };

    history = {
      size = 10000;
      path = "${config.home.homeDirectory}/zsh/history";
    };

    oh-my-zsh = {
      enable = true;
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
      ];
    };
  };

  programs.starship = {
    enable = true;

    # Configuration written to ~/.config/starship.toml
    settings =
      (
        with builtins; fromTOML (readFile "${pkgs.starship}/share/starship/presets/nerd-font-symbols.toml")
      )
      // {
        # overrides here, may be empty
      };
  };
}
