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
      homebank
      # Multimedia
      gimp spotify vlc
      # Puter touching
      dbeaver-bin mariadb nil
      libsForQt5.kate
      libsForQt5.plasma-systemmonitor
      # IM
      (discord.override {withVencord = true;})
      tdesktop element-desktop signal-desktop
      fluffychat
      # Gayming
      ppsspp-sdl-wayland
      retroarchBare prismlauncher
      lutris
      # Windows
      mono5 wine-staging winetricks
    ];
  };

  home.stateVersion = "22.11";
}
