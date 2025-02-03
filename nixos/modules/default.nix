{ ... }:
{
  # this could be done way better.
  imports = [
    ./desktop
    ./programs.nix
    ./users.nix
    ./networks.nix
  ];
}
