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
  ];

  environment.pathsToLink = [ "/share/nix-direnv" ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  virtualisation.libvirtd.enable = true;

  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # TODO wait for tuxedo-rs to be usable
  # hardware.tuxedo-rs = {
  #   enable = true;
  #   tailor-gui.enable = true;
  # };

  services.journald.extraConfig = ''
    SystemMaxUse=256M
    SystemMaxFileSize=16M
    SystemMaxFiles=32
  '';

  system.stateVersion = "22.11";
}
