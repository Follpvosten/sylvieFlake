{ ... }:
{
  # part of me really wants to keep these in configuration.nix
  # hostId could even go into hardware.nix cause it's a zfs thing
  networking.hostName = "tzuyu";
  networking.hostId = "56a91f16";

  # I do use this on desktop
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
  };

  # VPN - Tailscale
  services.tailscale.enable = true;
}
