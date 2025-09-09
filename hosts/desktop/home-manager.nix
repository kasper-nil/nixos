{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    backupFileExtension = "home";

    extraSpecialArgs = { inherit inputs; };

    users = {
      "kasper" =
        { ... }:
        {
          imports = [
            ./home-manager
          ];
        };
    };
  };
}
