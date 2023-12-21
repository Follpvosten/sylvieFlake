{ pkgs, ... }:
{
  imports = [
    ./apps.nix
    ./extensions.nix
  ];

  home.packages = with pkgs.gnome; [
    gnome-tweaks
  ];
}