{ pkgs, ... }:
{
  imports = [ ./modules ];

  home = {
    username = "sylvie";
    homeDirectory = "/home/sylvie";
    packages = with pkgs; [
      # General / Office
      bitwarden libreoffice
      diebahn
      # Multimedia
      gimp
      # Puter touching
      just nil
      # IM
      tdesktop fractal
      discord signal-desktop
      # social
      tuba
      (retroarch.withCores (
        cores: with cores; [
          desmume
        ]
      ))
    ];
  };

  home.stateVersion = "24.05";
}
