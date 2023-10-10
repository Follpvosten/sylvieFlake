{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      # General
      usernamehw.errorlens ms-azuretools.vscode-docker 
      matthewpi.caddyfile-support mkhl.direnv
      # 🦀
      vadimcn.vscode-lldb matklad.rust-analyzer
      bungcip.better-toml serayuzgur.crates
      # ❄️
      jnoortheen.nix-ide
    ];
    
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    mutableExtensionsDir = false;
    userSettings = {
      "files.insertFinalNewline" = true;
      "editor.formatOnSave" = true;
      "rust-analyzer.cargo.features" = "all";
      "rust-analyzer.check.command" = "clippy";
      "git.openRepositoryInParentFolders" = "never";
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "update.mode" = "none";
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace', monospace";
      "window.autoDetectColorScheme" = true;
    };
  };
}
