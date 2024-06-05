{ config, lib, ... }:
{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };

    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    kernelModules = [ ];

    kernelParams = [
      "fbcon=rotate:1"
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
  };

  hardware.bluetooth.enable = true;
  networking.useDHCP = lib.mkDefault true;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
