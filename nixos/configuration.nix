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

  networking.hostName = "godemiche";
  networking.networkmanager.enable = true;
  networking.hostId = "62323837";

  time.timeZone = "Europe/Vienna";
  i18n.defaultLocale = "de_AT.UTF-8";

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "48d6023c46a45822" ];
  };

  environment.systemPackages = with pkgs; [ 
    ripgrep 
    libsForQt5.ark zip rar
    vim wget
  ];

  environment.pathsToLink = [ "/share/nix-direnv" ];

  system.stateVersion = "22.11";
}
