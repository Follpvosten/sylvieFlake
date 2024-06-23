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
    # apparently this is needed for keyboard stuff
    "org/gnome/desktop/input-sources".show-all-sources = true;
  
    "org/gnome/mutter" = {
      # fractional scaling
      experimental-features = lib.hm.gvariant.mkArray "s" ["scale-monitor-framebuffer"];
      edge-tiling = true;
    };
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
    "org/gnome/shell/app-switcher".current-workspace-only = true;
  };
  # monitor config
  home.file."monitor-config" = {
    text = builtins.readFile ./monitors.xml;
    target = ".config/monitors.xml";
  };
}
