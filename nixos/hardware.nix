{ config, lib, ... }:

{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = !false; # agency of chaos
    };
    
    initrd = {
      availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" "sd_mod" "sdhci_acpi" ];
      kernelModules = [ ];
    };

    kernelModules = [ "r8723bs" ];

    kernelParams = [
      # this may be needed, not sure tho
      #"intel_idle.max_cstate=1"
    ];
  };


  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/5ef48d0e-0e07-4bd2-84a8-0ca924789c0e";
      fsType = "ext4";
    };
    "/nix" = {
      device = "zroot/ROOT/nixos/nix";
      fsType = "zfs";
      neededForBoot = true;
    };
    "/boot" = { 
      device = "/dev/disk/by-uuid/A215-063B";
      fsType = "vfat";
    };
  };
  swapDevices = [{device = "/dev/disk/by-uuid/7d7734a2-ecec-4bc2-a8bd-784d3038c713";}];

  hardware.bluetooth.enable = false;
  networking.useDHCP = lib.mkDefault true;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
