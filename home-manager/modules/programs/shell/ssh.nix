{ ... }:
{
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "kbackup" = {
        user = "jonas";
        hostname = "130.255.78.72";
        port = 22666;
      };
    };
  };
}
