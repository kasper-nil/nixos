{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    backupFileExtension = "home";

    extraSpecialArgs = { inherit inputs; };

    sharedModules = [
      inputs.nixhub.homeModules.hyprland
    ];

    users = {
      "kasper" =
        { ... }:
        {
          desktop-environment.hyprland.enable = true;
          imports = [ ./modules ];
        };
    };
  };
}
