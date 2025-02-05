{ pkgs, ... }:
{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  programs.dconf.profiles.gdm.databases = [{
    settings = {
      # this allows fractional scaling on the home screen.
      # because linking the config didn't work, this will just default to 1.5x,
      # which I think is reasonable for a single purpose UI like a login screen.
      "org/gnome/mutter".experimental-features = [ "scale-monitor-framebuffer" ];
    };
  }];

  # the new terminal sucks
  environment.gnome.excludePackages = with pkgs; [
    gnome-console gnome-tour gnome-logs yelp
  ];
  environment.systemPackages = [ pkgs.gnome-terminal ];
}
