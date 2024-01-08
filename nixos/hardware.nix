{ config, lib, ... }:
{
  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = !false; # agency of chaos
    };
    
    initrd = {
      availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" "sdhci_pci" ];
      kernelModules = [ ];
    };

    kernelModules = [ "r8723bs" ];

    kernelParams = [
      # this may be needed, not sure tho
      "intel_idle.max_cstate=1"
    ];
    kernel.sysctl = { "vm.swappiness" = 1; };
  };


  fileSystems = {
    
  };
  swapDevices = [{device = "/dev/disk/by-uuid/";}];

  hardware.bluetooth.enable = true;
  networking.useDHCP = lib.mkDefault true;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
