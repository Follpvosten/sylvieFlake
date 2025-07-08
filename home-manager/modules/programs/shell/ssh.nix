{ ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "kcloud" = {
        user = "wolfie";
        hostname = "cloud.karpador.xyz";
        port = 65522;
      };
      "kbackup" = {
        user = "jonas";
        hostname = "130.255.78.72";
        port = 22666;
      };
    };
  };
}
