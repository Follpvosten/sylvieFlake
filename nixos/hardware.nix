{ config, lib, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = !true; # agency of chaos
    };
    
    initrd = {
      availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "rtsx_usb_sdmmc" ];
      kernelModules = [ ];
    };

    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];

    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
  };


  fileSystems = {
    "/" = { 
      device = "zroot/ROOT/nixos";
      fsType = "zfs";
    };

    "/boot" = { 
      device = "/dev/disk/by-uuid/D542-D042";
      fsType = "vfat";
    };
  };

  hardware.bluetooth.enable = true;
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}