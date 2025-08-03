{ ... }:
{
  disko.devices.disk.main = {
    type = "disk";
    device = "/dev/nvme0n1";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          size = "512M";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        swap = {
          size = "12G";
          content = {
            type = "swap";
            randomEncryption = true;
          };
        };
        zroot = {
          size = "100%";
          content = {
            type = "zfs";
            pool = "zroot";
          };
        };
      };
    };
  };
  disko.devices.zpool.zroot = {
    type = "zpool";
    rootFsOptions = {
      mountpoint = "none";
      canmount = "off";
      compression = "lz4";
      relatime = "on";
      # https://openzfs.github.io/openzfs-docs/man/master/7/zfsprops.7.html#xattr
      xattr = "sa";
      primarycache = "none";
    };
    options.ashift = "13";

    datasets = let fs = mountpoint: {
      type = "zfs_fs";
      options.mountpoint = "legacy";
      inherit mountpoint;
    }; in {
      # root fs - no impermanence for now
      "root" = fs "/";
      # nix store
      "nix" = fs "/nix" // {
        options.compression = "zstd-6";
        # TODO find a good way to DRY this part
        options.mountpoint = "legacy";
      };
      # logs
      "log" = fs "/var/log" // {
        options.compression = "zstd-6";
        # TODO find a good way to DRY this part
        options.mountpoint = "legacy";
      };
      # for home folder
      "home" = fs "/home";
      # base dataset for multi-user data
      "data" = {
        type = "zfs_fs";
        options.mountpoint = "none";
      };
    };
  };
}
