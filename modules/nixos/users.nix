{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    users.kasper = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "kasper";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
      ];
      packages = with pkgs; [ ];
    };
  };
}
