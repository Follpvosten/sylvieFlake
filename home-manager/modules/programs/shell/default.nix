{ ... }: 
{

  imports = [ ./ssh.nix ]; 

  programs.fish.enable = true;

  programs.starship = {
    enable = true;
    enableFishIntegration = true; # unneeded in any way lol
    settings = import ./starship.nix;
  };

  programs.git = {
    enable = true;
    userName = "Sylvie Hacker"; # pay her a fee, also s/hack/heck/
    userEmail = "sylvie@karpador.xyz";
    extraConfig = {
      help.autoCorrect = "prompt";
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
