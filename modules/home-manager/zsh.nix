{ config, lib, ... }:
{
  options = {
    zsh.enable = lib.mkEnableOption "Enable zsh";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;

      syntaxHighlighting.enable = true;

      shellAliases = {
        # NixOS
        rebuild-desktop = "sudo nixos-rebuild switch --flake /etc/nixos#desktop";
        rebuild-work = "sudo nixos-rebuild switch --flake /etc/nixos#work";
        collect-garbage = "sudo nix-collect-garbage -d";
        configure = "code /etc/nixos";

        # Nix shells
        dev = "nix develop /etc/nixos#default";
        ttslabs = "nix develop /etc/nixos#ttslabs";
        work = "nix develop /etc/nixos#work --impure";
        cs2 = "nix develop /etc/nixos#cs2";

        # Docker
        docker-stop-all = "docker stop $(docker ps -a -q)";
        docker-kill-all = "docker rm $(docker ps -a -q)";
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
  };
}
