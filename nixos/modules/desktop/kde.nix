{ ... }:
{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "de_se_fi";
    };
  };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  programs.kdeconnect.enable = true;
}
