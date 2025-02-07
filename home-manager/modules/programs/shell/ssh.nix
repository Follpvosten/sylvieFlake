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
      "mail" = {
        user = "jonas";
        hostname = "mail.karpador.xyz";
        port = 45822;
      };
      "religio" = {
        user = "jonas";
        hostname = "192.99.161.36";
      };
      "dgnfog-netcup" = {
        user = "jonasrinner";
        hostname = "172.16.5.1";
      };
      "ci-runner" = {
        user = "jonas";
        hostname = "ci-runner01.dungeonfog.com";
      };
    };
  };
}
