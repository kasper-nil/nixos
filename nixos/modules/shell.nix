{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;

    shellInit = ''
      eval "$(starship init zsh)" 
    '';


  };

}
