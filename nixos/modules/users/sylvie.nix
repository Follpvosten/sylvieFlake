{ pkgs, ... }:
{
  users.users.sylvie = {
    isNormalUser = true;
    description = "Sylvie Hacker";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };
}