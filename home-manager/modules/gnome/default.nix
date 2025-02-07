{ pkgs, lib, ... }:
let
  gvariant = lib.hm.gvariant;
  mkStrArray = arr: gvariant.mkArray "s" arr;
in {
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
    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
      monospace-font-name = "FiraCode Nerd Font 10";
      icon-theme = "Adwaita";
      cursor-theme = "Adwaita";
    };
    "org/gnome/desktop/input-sources".xkb-options = mkStrArray [];
    "org/gnome/shell".favorite-apps = mkStrArray [
      "firefox.desktop"
      "thunderbird.desktop"
      "codium.desktop"
      "org.gnome.Nautilus.desktop"
    ];
    "org/gnome/desktop/search-providers".disabled = mkStrArray [
      "org.gnome.Nautilus.desktop"
      "org.gnome.Epiphany.desktop"
    ];
    "org/freedesktop/tracker/miner/files" = {
      index-single-directories = mkStrArray [];
      index-recursive-directories = mkStrArray [];
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-applications = mkStrArray [];
      switch-applications-backward = mkStrArray [];
      switch-windows = mkStrArray ["<Alt>Tab"];
      switch-windows-backward = mkStrArray ["<Shift><Alt>Tab"];
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
    # dragging windows to screen edges
    "org/gnome/mutter".edge-tiling = true;
    # currently doesn"t work on this device for some reason :/
    "org/gnome/settings-daemon/plugins/color".night-light-enabled = false;
    # power stuff
    "org/gnome/desktop/session".idle-delay = gvariant.mkUint32 0;
    "org/gnome/settings-daemon/plugins/power" = {
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };
  };
}
