{ pkgs, ... }:
{
  services.dunst = {
    enable = true;
    iconTheme.name = "Nordic-bluish";
    iconTheme.package = pkgs.nordic;
  };
}
