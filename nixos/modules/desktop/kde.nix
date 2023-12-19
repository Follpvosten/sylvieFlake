{ ... }:
{
  services.xserver = {
    enable = true;
    layout = "de";

    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
    desktopManager.plasma5.enable = true;
  };

  programs.kdeconnect.enable = true;
}
