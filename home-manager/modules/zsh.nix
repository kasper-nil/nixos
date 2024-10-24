{ config, pkgs, ... }:
{
  programs.starship = {
    enable = true;

    enableZshIntegration = true;

    presets = [ "nerd-font-symbols" ];

    # Configuration written to ~/.config/starship.toml
    settings = (with builtins; fromTOML (readFile ../dotfiles/staship.toml)) // {
      # overrides here, may be empty
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
