{ pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.zsh;

    users.kasper = {
      isNormalUser = true;

      description = "kasper";

      extraGroups = [
        "networkmanager"
        "wheel"
        "input" # For input-remapper, uinput devices
        "plugdev" # For ZSA keyboard flashing (Wally/Keymapp)
        "docker" # (or remove if not using)
        "video"
        "lp"
      ];
    };
  };
}
