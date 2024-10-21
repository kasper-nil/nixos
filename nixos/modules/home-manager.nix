{ inputs, ... } : {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  # Home manager
  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      kasper = import ../../home-manager/home.nix;
    };
  };
}