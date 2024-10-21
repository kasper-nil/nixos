{ config, pkgs, ... } : {

    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
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