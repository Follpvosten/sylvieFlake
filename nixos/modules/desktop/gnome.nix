{ config, ... }:
{
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "de_se_fi";

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  # link monitor config from user
  systemd.tmpfiles.settings."80-gdm-monitors" = {
    "${config.users.users.gdm.home}/.config/monitors.xml" = {
      "L+" = {
        argument = "${config.users.users.sylvie.home}/.config/monitors.xml";
      };
    };
  };
}
