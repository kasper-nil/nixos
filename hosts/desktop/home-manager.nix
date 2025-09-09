{ inputs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    inputs.nixhub.nixosModules.hyprland
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

          nixhub.hyprland.monitor = [
            "DP-2, 2560x1440@165, auto, 1"
          ];
        };
    };
  };
}
