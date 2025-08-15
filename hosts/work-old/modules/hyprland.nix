{ inputs, pkgs, ... }:
{
  imports = [
    inputs.catppuccin.nixosModules.catppuccin
  ];

  programs.hyprland = {
    enable = true;
  };

  services.displayManager = {
    enable = true;
    sddm = {
      enable = true;
      package = pkgs.kdePackages.sddm;
      wayland = {
        enable = true;
      };
    };
  };

  catppuccin = {
    enable = true;

    sddm = {
      enable = true;
      assertQt6Sddm = true;
    };
  };
}
