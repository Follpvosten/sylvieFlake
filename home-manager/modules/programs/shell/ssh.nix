{ ... }:
{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
    matchBlocks = {
      "kcloud" = {
        user = "wolfie";
        hostname = "89.58.16.80";
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
