{ lib, config, ... }:
{
  git.enable = true;

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userEmail = "kasper.nilssen1@gmail.com";
      userName = "Kasper Nilssen";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/etc/nixos";
      };
    };
  };
}
