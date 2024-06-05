{ ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "de_se_fi";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
