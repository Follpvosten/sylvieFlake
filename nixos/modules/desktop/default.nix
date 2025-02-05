{ pkgs, ... }:
{
  imports = [
    ./kde.nix
    ./sound.nix
  ];

  programs.steam.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "de_se_fi";
      # unset to make ctrl-backspace work in gtk apps
      options = "";
    };
    excludePackages = [ pkgs.xterm ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
