{ ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
    declarative = true;
    serverProperties = {
      server-port = 43000;
      difficulty = 3;
      gamemode = 1;
      max-players = 5;
      motd = "Kasper and Ivanka server";
      white-list = false;
      allow-cheats = true;
    };
    jvmOpts = "-Xms4092M -Xmx4092M -XX:+UseG1GC -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10";
  };
}
