{ ... }: 
{

  imports = [ ./ssh.nix ]; 

  programs.starship = {
    enable = true;
    enableFishIntegration = true; # unneeded in any way lol
    settings = import ./starship.nix;
  };

  programs.git = {
    enable = true;
    userName = "Sylvie Hacker"; # pay her a fee, also s/hack/heck/
    userEmail = "sylvie@karpador.xyz";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  environment.pathsToLink = [ "/share/nix-direnv" ];
}