{ config, lib, ... }:

{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
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

    # https://www.reddit.com/r/zfs/comments/1826lgs/psa_its_not_block_cloning_its_a_data_corruption/
    # https://github.com/openzfs/zfs/issues/15526#issuecomment-1823737998
    kernelParams = [
      "zfs.zfs_dmu_offset_next_sync=0"
      "zfs.zfs_arc_max=12884901888"
    ];
  };


  fileSystems = {
    "/" = { 
      device = "zroot/ROOT/nixos";
      fsType = "zfs";
    };
    "/nix" = {
      device = "zroot/ROOT/nixos/nix";
      fsType = "zfs";
      neededForBoot = true;
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
