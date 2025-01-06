{ config, lib, ... }:
{
  options = {
    docker.enable = lib.mkEnableOption "Enable docker";
  };

  config = lib.mkIf config.docker.enable {
    virtualisation.docker = {
      enable = true;
      logDriver = "json-file";
    };
  };
}
