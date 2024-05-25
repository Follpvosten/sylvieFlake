{ pkgs, ... }:
{
  users.users.sylvie = {
    isNormalUser = true;
    description = "Sylvie Hacker";
    extraGroups = [ "wheel" "networkmanager" "adbusers" ];
    shell = pkgs.fish;
  };
}
