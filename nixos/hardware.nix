{ config, lib, ... }:
{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "rtsx_usb_sdmmc" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];

    kernelParams = [ "zfs.zfs_arc_max=524288000" ];
  };

  fileSystems = {
    "/" = { 
      device = "zroot/ROOT/nixos";
      fsType = "zfs";
    };
    "/nix" = {
      device = "zroot/ROOT/nixos/nix";
      fsType = "zfs";
    };
    "/home" = {
      device = "zroot/HOME";
      fsType = "zfs";
    };
    "/home/sylvie" = {
      device = "zroot/HOME/sylvie";
      fsType = "zfs";
    };
    "/home/sylvie/iso" = {
      device = "zroot/HOME/sylvie/iso";
      fsType = "zfs";
    };
    "/boot" = { 
      device = "/dev/disk/by-uuid/D542-D042";
      fsType = "vfat";
    };
  };

  hardware.bluetooth.enable = true;
  networking.useDHCP = lib.mkDefault true;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
