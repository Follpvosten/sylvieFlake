{ pkgs, ... }:
{
  programs.gnome-shell.enable = true;
  programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
    { package = appindicator; }
    { package = night-theme-switcher; }
  ];
  dconf.settings = {
    "org/gnome/shell/extensions/nightthemeswitcher/time" = {
      # it complains without this
      manual-schedule = true;
      sunrise = 8.0;
      sunset = 16.5;
    };
  };
}
