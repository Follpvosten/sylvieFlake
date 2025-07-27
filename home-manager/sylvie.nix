{ pkgs, ... }:
{
  imports = [ ./modules ];

  home = {
    username = "sylvie";
    homeDirectory = "/home/sylvie";
    packages = with pkgs; [
      # General / Office
      libreoffice diebahn
      # Multimedia
      gimp
      # Puter touching
      just nil
      # IM
      tdesktop fractal
      discord signal-desktop
      # social
      tuba
      # gayme
      (retroarch.withCores (
        cores: with cores; [
          desmume
        ]
      ))
    ];
  };

  home.stateVersion = "24.05";
}
