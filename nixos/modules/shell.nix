{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;

    shellInit = ''
      eval "$(starship init zsh)" 
    '';

    shellAliases = {
      update = "sudo nixos-rebuild switch --flake /etc/nixos#default";
    };
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
