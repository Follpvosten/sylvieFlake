{ ... }:
{
  imports = [
    ./gnome.nix
    ./sound.nix
  ];

  # WAYLAND ALL THE THINGS
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
