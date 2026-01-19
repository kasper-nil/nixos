{ config, ... }:
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;

    syntaxHighlighting.enable = true;

    shellAliases = {
      # NixOS
      rebuild-desktop = "sudo nixos-rebuild switch --flake /etc/nixos#desktop";
      rebuild-work = "sudo nixos-rebuild switch --flake /etc/nixos#work";
      rebuild-server = "nixos-rebuild switch --flake /etc/nixos#server --target-host root@192.168.0.216";
      collect-garbage = "sudo nix-collect-garbage -d";
      configure = "code /etc/nixos";

      # Nix shells
      ttslabs = "nix develop /etc/nixos#ttslabs";
      ttslabs-prod = "nix develop /etc/nixos#ttslabs-prod";
      work = "nix develop /etc/nixos#work --impure";
      cs2 = "nix develop /etc/nixos#cs2";
      react-native = "nix develop /etc/nixos#react-native --impure";
      tauri = "nix develop /etc/nixos#tauri --impure";
      tts = "nix develop /etc/nixos#tts --impure";

      # Docker
      docker-stop-all = "docker stop $(docker ps -a -q)";
      docker-kill-all = "docker rm $(docker ps -a -q)";
    };

    history = {
      size = 1000000;
      path = "${config.home.homeDirectory}/.config/zsh/history";
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
}
