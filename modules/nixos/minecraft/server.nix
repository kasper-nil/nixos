{ lib, config, ... }:
{
  options = {
    minecraft-server.enable = lib.mkEnableOption "Enable minecraft-server";
  };

  config = lib.mkIf config.minecraft-server.enable {
    services.minecraft-server = {
      enable = false;
      eula = true;

      openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
      declarative = true;

      serverProperties = {
        server-port = 50000;
        difficulty = "normal";
        gamemode = 0;
        force-gamemode = true;
        max-players = 2;
        motd = "Kasper and Ivanka server";
        white-list = false;
        allow-cheats = true;
      };
    };
  };
}
