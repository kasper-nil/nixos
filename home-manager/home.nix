{ 
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ... 
} : {
  imports = [ 
    ./modules/i3.nix
    ./modules/git.nix
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
  };

  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "24.05";
}
