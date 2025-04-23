{ pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.sylvie = {
    isNormalUser = true;
    description = "Sylvie Hacker";
    extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    shell = pkgs.fish;
  };
  users.users.refraction = {
    isNormalUser = true;
    description = "refraction system";
    extraGroups = [ "networkmanager" ];
    packages = [ pkgs.firefox ];
  };
}
