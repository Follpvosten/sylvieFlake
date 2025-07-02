{ pkgs, ... }:
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-console gnome-tour gnome-logs yelp
  ];
  # the new terminal sucks
  environment.systemPackages = [ pkgs.gnome-terminal ];
}
