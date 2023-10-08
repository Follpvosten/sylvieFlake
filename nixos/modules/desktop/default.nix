{ ... }:
{
  # and i mean *way* better.
  imports = [
    ./kde.nix
    ./sound.nix
  ];

  programs.steam.enable = true;
}