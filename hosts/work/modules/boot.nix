{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;

    kernelParams = [
      "ip=10.0.0.200::10.0.0.1:255.255.255.0::enp0s31f6:none"
    ];

    initrd = {
      network = {
        enable = true;
        ssh = {
          enable = true;
          port = 22;
          hostKeys = [ "/etc/ssh/initrd_ssh_host_ed25519_key" ];
          authorizedKeys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIItzoADPDxWtE4WTsd0gDnR2efEKHm6NStjhxM/do28y kasper@nixos"
          ];
        };
        postCommands = ''
          ip addr show dev enp3s0 > /tmp/initrd-ip.txt || true
          ip route show > /tmp/initrd-route.txt || true
        '';
      };
    };

    kernel.sysctl = {
      "fs.inotify.max_user_instances" = 65536;
      "fs.inotify.max_user_watches" = 2097152;
      "fs.inotify.max_queued_events" = 1048576;
    };

    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
