{ pkgs, ... }:
{
  imports = [ ./modules ];

  home = {
    username = "sylvie";
    homeDirectory = "/home/sylvie";
    packages = with pkgs; [
      # General / Office
      bitwarden yakuake
      thunderbird libreoffice-qt
      nextcloud-client 
      hunspell hunspellDicts.de_DE # :beer: 
      # Multimedia
      gimp spotify vlc 
      # Puter touching
      dbeaver nil 
      libsForQt5.kate
      libsForQt5.plasma-systemmonitor
      # IM
      (discord.override {withVencord = true;})
      tdesktop element-desktop signal-desktop
      fluffychat
      # Gayming
      citra-nightly ppsspp-sdl-wayland
      retroarchBare prismlauncher
      lutris
      # Windows
      mono5 wine-staging winetricks
    ];
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vkcapture
      obs-gstreamer
      obs-backgroundremoval
    ];    
  };

  home.stateVersion = "22.11";
}
