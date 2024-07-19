{ pkgs, lib, ... }:
{
  imports = [
    ./apps.nix
    ./extensions.nix
  ];

  home.packages = with pkgs; [
    gnome-tweaks
  ];

  # gonna put the settings here for now, mayb move to submodules later
  dconf.settings = {
    # UI/UX settings
    "org/gnome/shell/app-switcher".current-workspace-only = true;
    "org/gnome/desktop/interface".show-battery-percentage = true;
    "org/gnome/shell".favorite-apps = lib.hm.gvariant.mkArray "s" [
      "firefox.desktop"
      "org.gnome.Geary.desktop"
      "org.gnome.Calendar.desktop"
      "org.gnome.Nautilus.desktop"
      "org.gnome.Console.desktop"
    ];
    "org/gnome/desktop/search-providers".disabled = lib.hm.gvariant.mkArray "s" [
      "org.gnome.Nautilus.desktop"
      "org.gnome.Epiphany.desktop"
    ];
    "org/freedesktop/tracker/miner/files" = {
      index-single-directories = lib.hm.gvariant.mkArray "s" [];
      index-recursive-directories = lib.hm.gvariant.mkArray "s" [];
    };
    # hmm, adding custom wallpapers with light/dark variants seems pretty easy!
    "org/gnome/desktop/background" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/amber-l.jxl";
      picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/amber-d.jxl";
      primary-color = "#ff7800";
    };
    # and lockscreen can have different settings, too.
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/amber-l.jxl";
      primary-color = "#ff7800";
    };

    # apparently this is needed for keyboard stuff
    "org/gnome/desktop/input-sources".show-all-sources = true;

    "org/gnome/mutter" = {
      # fractional scaling
      experimental-features = lib.hm.gvariant.mkArray "s" ["scale-monitor-framebuffer"];
      edge-tiling = true;
    };
    # currently doesn"t work on this device for some reason :/
    "org/gnome/settings-daemon/plugins/color".night-light-enabled = false;
    # power stuff
    "org/gnome/desktop/session".idle-delay = lib.hm.gvariant.mkUint32 0;
    "org/gnome/settings-daemon/plugins/power" = {
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };
  };
  # monitor config
  xdg.configFile."monitors.xml".source = ./monitors.xml;

  gtk.theme.name = "adw-gtk3-dark";
}
