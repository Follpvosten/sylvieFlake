{ ... }:
{
  services.xserver = {
    enable = true;
    layout = "de";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
}
