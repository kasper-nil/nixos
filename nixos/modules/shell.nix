{ pkgs, ... }:
{
  programs.zsh = {
    # Enable zsh, this needs to happen in the nixos configuration
    enable = true;
    shellInit = ''
      eval "$(starship init zsh)" 
    '';
    enableCompletion = true;
    syntaxHighlighting.enable = true;
  };

  programs.starship = {
    enable = true;

    # Configuration written to ~/.config/starship.toml
    settings =
      (
        with builtins; fromTOML (readFile "${pkgs.starship}/share/starship/presets/bracketed-segments.toml")
      )
      // {
        # overrides here, may be empty
      };
  };
}
