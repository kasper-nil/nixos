{ inputs, ... }:
{
  nix = {
    # Stuff for nixd LSP
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
