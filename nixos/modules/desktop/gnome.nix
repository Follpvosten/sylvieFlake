{ ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "de_se_fi";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  # link monitor config from user
  programs.dconf.profiles = {
    gdm.databases = [{
      settings = {
        # GDM by default is always unscaled compared to the GNOME lockscreen.
        "org/gnome/mutter".experimental-features = [ "scale-monitor-framebuffer" ];
      };
    }];
  };
}
