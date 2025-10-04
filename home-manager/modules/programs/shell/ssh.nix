{ ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "kbackup" = {
        user = "jonas";
        hostname = "130.255.78.72";
        port = 22666;
      };
    };
  };
}
