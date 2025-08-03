{ pkgs, ... }:
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-console gnome-tour gnome-logs yelp geary totem
  ];
  # the new terminal sucks
  environment.systemPackages = with pkgs; [
    gnome-terminal clapper celluloid
  ];
}
