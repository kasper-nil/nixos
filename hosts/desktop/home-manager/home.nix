{ pkgs, ... }:
{
  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";

    packages = with pkgs; [
      gh
    ];
  };
}
