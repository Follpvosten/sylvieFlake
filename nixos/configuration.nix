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
  # nixpkgs.overlays = [(final: prev: {
  #   clapper = prev.clapper.overrideAttrs(old: {
  #     buildInputs = old.buildInputs ++ [
  #       pkgs.gst_all_1.gst-libav pkgs.gst_all_1.gst-vaapi
  #     ];
  #   });
  # })];

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
  services.earlyoom = {
    enable = true;
    freeMemThreshold = 2;
    freeSwapThreshold = 100;
  };

  services.journald.extraConfig = ''
    SystemMaxUse=256M
    SystemMaxFileSize=16M
    SystemMaxFiles=32
  '';

  systemd.services.drop-caches = {
    enable = true;
    description = "drop filesystem caches";
    script = ''
      echo 2 > /proc/sys/vm/drop_caches
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
    startAt = "*:0/10";
  };

  system.stateVersion = "24.05";
}
