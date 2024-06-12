{ pkgs, ... }:
{
  imports = [ ./modules ];

  home = {
    username = "sylvie";
    homeDirectory = "/home/sylvie";
    packages = with pkgs; [
      # General / Office
      bitwarden libreoffice
      # Multimedia
      gimp
      # Puter touching
      just nil lapce
      # IM
      tdesktop fractal fluffychat
      discord signal-desktop
      # social
      tuba
    ];
  };

  home.stateVersion = "24.05";
}
