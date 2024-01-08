{ ... }:
{
  # part of me really wants to keep these in configuration.nix
  # hostId could even go into hardware.nix cause it's a zfs thing
  networking.hostName = "godemiche";
  networking.hostId = "62323837";

  # I do use this on desktop
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    # allow all traffic from zerotier
    trustedInterfaces = ["ztosikmzde"];
  };

  # VPN - ZeroTier
  services.zerotierone = {
    enable = true;
    joinNetworks = ["48d6023c46a45822"];
  };

  # VPN - Tailscale
  services.tailscale.enable = true;
}
