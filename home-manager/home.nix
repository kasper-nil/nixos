{ 
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ... 
} : {
  imports = [ 
    ./modules/i3
    ./modules/git.nix
    ./modules/zsh.nix
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
  };
}
