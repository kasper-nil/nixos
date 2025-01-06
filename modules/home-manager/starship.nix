{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    starship.enable = lib.mkEnableOption "Enable starship";
  };

  config = lib.mkIf config.starship.enable {
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
  };
}
