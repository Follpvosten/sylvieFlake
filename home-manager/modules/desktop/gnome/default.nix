{ pkgs, lib, ... }:
{
  imports = [
    ./apps.nix
    ./extensions.nix
  ];

  home.packages = with pkgs.gnome; [
    gnome-tweaks
  ];

  # gonna put the settings here for now, mayb move to submodules later
  dconf.settings = {
    # interface preferences
    "org/gnome/desktop/interface".show-battery-percentage = true;
    # fractional scaling
    "org/gnome/mutter".experimental-features = lib.hm.gvariant.mkArray "s" ["scale-monitor-framebuffer"];
    # currently doesn't work on this device for some reason :/
    "org/gnome/settings-daemon/plugins/color".night-light-enabled = false;
    # power stuff
    "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
    "org/gnome/settings-daemon/plugins/power" = {
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };
    "org/gnome/nautilus/icon-view".default-zoom-level = "small-plus";
  };
  # monitor config
  home.file."monitor-config" = {
    text = builtins.readFile ./monitors.xml;
    target = ".config/monitors.xml";
  };
}
