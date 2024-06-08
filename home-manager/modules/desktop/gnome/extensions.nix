{ pkgs, ... }:
{
  # enable/disable extensions completely
  dconf.settings."org/gnome/shell".disable-user-extensions = false;
  home.packages = with pkgs.gnomeExtensions; [
    appindicator
  ];
  dconf.settings."org/gnome/shell".enabled-extensions = [
    "appindicatorsupport@rgcjonas.gmail.com"
  ];
}
