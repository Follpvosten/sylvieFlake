{ pkgs, ... }:
{
  imports = [ ./modules ];

  home = {
    username = "sylvie";
    homeDirectory = "/home/sylvie";
    packages = with pkgs; [
      # General / Office
      bitwarden
      # Multimedia
      gimp
      # Puter touching
      nil lapce
      # IM
      tdesktop fractal fluffychat
    ];
  };

  home.stateVersion = "22.11";
}
