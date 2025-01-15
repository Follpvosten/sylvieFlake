{ config, lib, ... }:
{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "0";
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };

    kernelModules = [ ];
    kernelParams = [
      "zfs.zfs_arc_max=67108864"
      "video=DSI-1:panel_orientation=right_side_up"
    ];
  };


  fileSystems = {
    "/" = {
      device = "zroot/nixos";
      fsType = "zfs";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/4721-8607";
      fsType = "vfat";
    };
    "/nix" = {
      device = "zroot/nix";
      fsType = "zfs";
    };
    "/home" = {
      device = "zroot/home";
      fsType = "zfs";
    };
    "/home/sylvie" = {
      device = "zroot/home/sylvie";
      fsType = "zfs";
    };
    "/home/sylvie/Videos" = {
      device = "zroot/data/video";
      fsType = "zfs";
    };
  };
  swapDevices = [{device="/dev/zvol/zroot/swap";}];

  hardware.bluetooth.enable = true;
  networking.useDHCP = lib.mkDefault true;
  systemd.services.modem-manager.enable = false;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
