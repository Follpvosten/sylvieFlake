# this file is generally where stuff goes that doesn't have its own module (yet)
{ pkgs, ... }:
{
  imports = [
    ./modules
    ./hardware.nix
  ];

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  fonts.packages = [ pkgs.nerd-fonts.fira-code ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";

  environment.systemPackages = with pkgs; [
    ripgrep
    zip rar p7zip
    vim wget
    git htop
    adw-gtk3
  ];

  environment.pathsToLink = [ "/share/nix-direnv" ];

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  systemd.oomd.enable = false;
  services.earlyoom.enable = true;

  system.stateVersion = "24.05";
}
