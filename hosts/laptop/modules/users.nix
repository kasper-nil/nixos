{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.zsh;

    users.kasper = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "kasper";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "docker"
        "video"
        "lp"
      ];
    };
  };
}
