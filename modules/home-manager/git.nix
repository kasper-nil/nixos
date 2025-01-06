{ lib, config, ... }:
{
  options = {
    git.enable = lib.mkEnableOption "Enable git";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userEmail = "kasper.nilssen1@gmail.com";
      userName = "nilssen98";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
      };
    };
  };
}
