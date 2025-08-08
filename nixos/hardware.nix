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
      # attempt to *actually* limit arc size...
      "zfs.zfs_arc_sys_free=6442450944"
      # recommended by powertop
      "nmi_watchdog=0"
    ];
    kernel.sysctl = {
      # recommended by powertop
      "vm.dirty_writeback_centisecs" = 1500;
      # recommended by me
      "vm.swappiness" = 1;
    };
    extraModprobeConfig = ''
      options snd_hda_intel power_save=1
    '';
    zfs.forceImportRoot = false;
  };
  services.zfs.trim.enable = true;
  # recommended by powertop: runtime power management for all PCI devices
  # https://wiki.archlinux.org/title/Power_management#PCI_Runtime_Power_Management
  # services.udev.extraRules = ''
  #   SUBSYSTEM=="pci", ATTR{power/control}="auto"
  # '';

  fileSystems = {
    "/home/sylvie" = {
      device = "zroot/home/sylvie";
      fsType = "zfs";
    };
    "/home/sylvie/Videos" = {
      device = "zroot/data/video";
      fsType = "zfs";
    };
  };

  hardware.bluetooth.enable = true;
  networking.useDHCP = lib.mkDefault true;
  systemd.services.modem-manager.enable = false;

  hardware.enableRedistributableFirmware = true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
