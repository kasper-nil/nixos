{ ... }:
{
  imports = [
    ../../modules/home-manager
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
}
