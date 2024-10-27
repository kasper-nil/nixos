{ pkgs, lib, ... }:
{
  imports = [
    ../modules/home-manager/i3.nix
    ../modules/home-manager/git.nix
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/alacritty.nix
    #../modules/home-manager/i3status-rust.nix
    ../modules/home-manager/rofi.nix
  ];

  home = {
    username = "kasper";
    homeDirectory = "/home/kasper";
    stateVersion = "24.05";
  };

  systemd.user.services = {
    plasma-kwin_x11 = {
      Install = {
        WantedBy = lib.mkForce [ ];
      };
    };
    plasma-i3 = {
      Unit = {
        Description = "Plasma custom window manager";
        Before = [ "plasma-workspace.target" ];
      };
      Install = {
        WantedBy = [ "plasma-workspace.target" ];
      };
      Service = {
        ExecStart = "${pkgs.writeShellScript "start-i3" ''
          #!/run/current-system/sw/bin/bash
          ${pkgs.i3}/bin/i3
        ''}";
        Restart = "on-failure";
      };
    };
  };

  programs = {
    home-manager.enable = true;
  };
}
