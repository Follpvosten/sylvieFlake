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
    kdePackages.ark zip rar p7zip
    vim wget
    git htop
  ];

  environment.pathsToLink = [ "/share/nix-direnv" ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # TODO wait for tuxedo-rs to be usable
  # hardware.tuxedo-rs = {
  #   enable = true;
  #   tailor-gui.enable = true;
  # };

  system.stateVersion = "22.11";
}
