{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    # Configuration written to ~/.config/starship.toml
    settings = {
      presets = [ "nerd-font-symbols" ];

      # character = {
      #   success_symbol = "[➜](bold green)";
      #   error_symbol = "[➜](bold red)";
      # };

      # package.disabled = true;
    };

  };

  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      eval "$(starship init zsh)" 
    '';

    shellAliases = {
      boob = "ls -a";
      rebuild = "sudo nixos-rebuild switch --flake .#default";
      clean = "sudo nix-collect-garbage -d";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
