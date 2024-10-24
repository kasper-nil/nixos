{
  programs = {
    # Enable zsh, this needs to happen in the nixos configuration
    zsh.enable = true;
    zsh.shellInit = ''
      eval "$(starship init zsh)" 
    '';
  };
}
