{ inputs, ... }:
{
  imports = [
    ./modules
    inputs.disko.nixosModules.disko
  ];
}
