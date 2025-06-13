{ ... }:
{
  programs.git = {
    enable = true;

    userEmail = "kasper.nilssen1@gmail.com";
    userName = "Kasper Nilssen";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
