{ pkgs, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "de_se_fi";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  programs.dconf.profiles = {
    gdm.databases = [{
      settings = {
        # this allows fractional scaling on the home screen.
        # because linking the config didn't work, this will just default to 1.5x,
        # which I think is reasonable for a single purpose UI like a login screen.
        "org/gnome/mutter".experimental-features = [ "scale-monitor-framebuffer" ];
      };
    }];
  };
  # the new one sucks
  environment.gnome.excludePackages = [ pkgs.gnome-console ];
  environment.systemPackages = [ pkgs.gnome-terminal ];
}
