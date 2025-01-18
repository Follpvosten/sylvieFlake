{ ... }:
{
  imports = [
    ./firefox
    ./shell
    ./vscode
  ];

  programs.emacs.enable = true;
}
