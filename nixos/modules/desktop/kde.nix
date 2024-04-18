{ ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "de";
    desktopManager.plasma5.enable = true;
  };
  services.displayManager = {
    sddm.enable = true;
    defaultSession = "plasmawayland";
  };

  programs.kdeconnect.enable = true;
}
