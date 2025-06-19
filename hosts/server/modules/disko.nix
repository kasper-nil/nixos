{ lib, ... }:
{
  disko.devices = {
    disk.main = {
      type = "disk";
      device = lib.mkDefault "/dev/sdb"; # change if your laptop exposes nvme0n1, etc.
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "500M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot"; # systemd-boot will live here
            };
          };

          swap = {
            size = "4G"; # or 4G, depending on how much swap you want
            content = {
              type = "swap";
              randomEncryption = false;
            };
          };

          root = {
            size = "100%";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/"; # everything else
            };
          };
        };
      };
    };
  };
}
