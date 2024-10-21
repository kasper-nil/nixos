{
    programs.git = {
        enable = true;
        userEmail = "kasper.nilssen1@gmail.com";
        userName = "nilssen98";
        extraConfig = {
            init.defaultBranch = "main";
            safe.directory = "/etc/nixos";
        };
    };
}