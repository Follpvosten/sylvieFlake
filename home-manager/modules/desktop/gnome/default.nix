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
    # power stuff
    "org/gnome/settings-daemon/plugins/color".night-light-enabled = true;
    "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
    "org/gnome/settings-daemon/plugins/power" = {
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };
  };
}
