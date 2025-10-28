{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "kasper.nilssen@horizonsoftware.no";
        name = "Kasper Nilssen";
      };
      
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
