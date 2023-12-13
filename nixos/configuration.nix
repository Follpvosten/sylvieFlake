# this file is generally where stuff goes that doesn't have its own module (yet)
{ pkgs, ... }:
{

  imports = [ 
    ./modules 
    ./hardware.nix  
  ];

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    settings = {
      keep-outputs = true;
      keep-derivations = true;
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    package = pkgs.nixFlakes;
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";

  environment.systemPackages = with pkgs; [ 
    ripgrep 
    libsForQt5.ark zip rar p7zip
    vim wget
    git
  ];

  environment.pathsToLink = [ "/share/nix-direnv" ];
  
  # domt go to sleemp
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchDocked = "ignore";

  system.stateVersion = "23.05";
}
