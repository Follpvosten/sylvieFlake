{ pkgs, ... }:
{
  programs.gnome-shell.enable = true;
  programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
    { package = appindicator; }
    { package = night-theme-switcher; }
    { package = auto-power-profile; }
  ];
  dconf.settings = {
    "org/gnome/shell/extensions/nightthemeswitcher/time" = {
      # it complains without this
      manual-schedule = true;
      sunrise = 8.0;
      sunset = 16.5;
    };
    "org/gnome/shell/extensions/auto-power-profile" = {
      # profile on battery should always be power saver
      bat = "power-saver";
      # avoid annoying noise when charging
      ac = "balanced";
      # if the profile is manually overridden,
      # switch to power saver at XX% battery
      threshold = 30;
    };
  };
}
