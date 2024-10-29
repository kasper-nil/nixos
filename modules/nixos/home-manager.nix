{ inputs, outputs, ... }:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };

    backupFileExtension = "backup";

    users = {
      kasper = import ../../home-manager/home.nix;
    };
  };
}
