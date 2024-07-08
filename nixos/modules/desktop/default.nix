{ ... }:
{
  # and i mean *way* better.
  imports = [
    ./kde.nix
    ./sound.nix
  ];

  programs.steam.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
