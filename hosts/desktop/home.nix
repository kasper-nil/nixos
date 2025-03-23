{ ... }:
{
  imports = [
    ./../../modules/home-manager/default.nix
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "electron-27.3.11"
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
