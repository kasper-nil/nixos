{ inputs, outputs, ... } : {
  imports = [ 
    inputs.home-manager.nixosModules.home-manager 
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };

    # TODO: figure out what this actually does, i3 didn't work before setting this in
    backupFileExtension = "backup";

    users = {
      kasper = import ../../home-manager/home.nix;
    };
  };
}