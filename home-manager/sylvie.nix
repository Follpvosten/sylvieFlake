{ pkgs, ... }:
{
  imports = [ ./modules ];

  home = {
    username = "sylvie";
    homeDirectory = "/home/sylvie";
    packages = with pkgs; [
      # General / Office
      bitwarden diebahn
      thunderbird libreoffice
      nextcloud-client
      hunspell hunspellDicts.de_DE
      # Multimedia
      gimp spotify vlc
      # Puter touching
      nil just cargo
      # IM
      vesktop tdesktop element-desktop
      signal-desktop fractal tuba
      # Gayming
      ppsspp-sdl-wayland
      retroarchBare
      lutris azahar
      obs-studio obs-studio-plugins.obs-vkcapture
      obs-studio-plugins.obs-pipewire-audio-capture
      # Windows
      mono wine-staging winetricks
    ];
  };

  xdg.configFile."containers/storage.conf".text = ''
  [storage]
  driver = "vfs"
  '';

  home.stateVersion = "22.11";
}
