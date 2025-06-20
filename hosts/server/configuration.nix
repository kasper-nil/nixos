{ inputs, ... }:
{
  imports = [
    ./modules
    inputs.disko.nixosModules.disko
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  system = {
    stateVersion = "24.05";
  };

  networking = {
    hostName = "server";

    firewall = {
      allowedTCPPortRanges = [
        {
          from = 100;
          to = 65535;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 100;
          to = 65535;
        }
      ];
    };

    interfaces.wlan0.ipv4.addresses = [
      {
        address = "192.168.1.80";
        prefixLength = 24;
      }
    ];

    networkmanager = {
      enable = true;
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };

    oci-containers = {
      backend = "docker";
      containers = {
        homeassistant = {
          volumes = [ "home-assistant:/config" ];
          environment.TZ = "Europe/Oslo";
          image = "ghcr.io/home-assistant/home-assistant:stable"; # Warning: if the tag does not change, the image will not be updated
          extraOptions = [
            "-p=8123:8123"
            "--volume=/run/dbus:/run/dbus"
          ];
        };
      };
    };
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
        PasswordAuthentication = true;
      };
    };

    logind = {
      # Ignore the lid behavior
      lidSwitch = "ignore"; # on battery :contentReference[oaicite:0]{index=0}
      lidSwitchExternalPower = "ignore"; # on AC :contentReference[oaicite:1]{index=1}
      lidSwitchDocked = "ignore"; # when HDMI/DP docked :contentReference[oaicite:2]{index=2}
      extraConfig = ''
        HandleLidSwitch=ignore              # fallback for future logind versions :contentReference[oaicite:3]{index=3}
      '';
    };

    avahi = {
      enable = true;
      nssmdns4 = true; # allows resolving .local names via /etc/nsswitch.conf
      publish.enable = true; # let others discover this host
      ipv4 = true;
      reflector = true; # reflect mDNS between wlan0 and eth0 (optional)
    };

    dbus = {
      enable = true;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "iwlwifi" ];
  };

  users = {
    users.server = {
      isNormalUser = true;
      initialPassword = "root"; # plainly insecure
      extraGroups = [
        "wheel"
        "docker"
      ];
      openssh.authorizedKeys.keys = [
        # paste your LAN laptop key here
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEoN2IvPdrgvxOU4CquV1FkAy144X3bFyusbSBRjc7T2 kasper.nilssen1@gmail.com."
      ];
    };
  };

  security = {
    sudo.wheelNeedsPassword = false;
  };

  nix = {
    settings = {
      require-sigs = false; # accept unsigned paths
      trusted-users = [
        "root"
        "@wheel"
      ]; # allow the copy to run as root or wheel
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  hardware = {
    enableAllHardware = true;
    enableAllFirmware = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

  systemd = {
    services = {
      ## turn the panel back-light fully off when closed
      backlight-off = {
        wantedBy = [ "multi-user.target" ];
        script = ''
          echo 0 > /sys/class/backlight/*/brightness
        '';
        serviceConfig.Type = "oneshot";
      };
    };
  };
}
