{ ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Kasper Nilssen";
        email = "kasper.nilssen1@gmail.com";
      };

      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
