{ ... }:
{
  programs.git = {
    enable = true;
    userEmail = "kasper.nilssen@horizonsoftware.no";
    userName = "Kasper Nilssen";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
