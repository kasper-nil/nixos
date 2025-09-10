{ inputs, ... }:
{
  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "server"
      ];
    };
  };
}
