{ pkgs, ... }:
{
  programs.starship = {
    enable = true;

    # Configuration written to ~/.config/starship.toml
    settings =
      (
        with builtins;
        fromTOML (readFile "${pkgs.starship}/share/starship/presets/no-runtime-versions.toml")
      )
      // {
        # overrides here, may be empty
      };
  };
}
