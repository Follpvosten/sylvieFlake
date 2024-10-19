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
      kdePackages.kate
      kdePackages.plasma-systemmonitor
      just
      # IM
      (discord.override {withVencord = true;})
      tdesktop element-desktop signal-desktop
      fractal
      # Gayming
      ppsspp-sdl-wayland
      retroarchBare
      lutris
      # Windows
      mono5 wine-staging winetricks
    ];
  };

  xdg.configFile."containers/storage.conf".text = ''
  [storage]
  driver = "vfs"
  '';

  home.stateVersion = "22.11";
}
