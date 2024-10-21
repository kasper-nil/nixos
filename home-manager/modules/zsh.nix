{ config, pkgs, ... } : {
  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      boob = "ls -a";
      rebuild = "sudo nixos-rebuild switch --flake .#default";
      clean = "sudo nix-collect-garbage -d";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; } 
      ];
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}