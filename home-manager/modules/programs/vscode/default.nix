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
      vadimcn.vscode-lldb rust-lang.rust-analyzer
      bungcip.better-toml serayuzgur.crates
      # ❄️
      jnoortheen.nix-ide
    ];

    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    mutableExtensionsDir = false;
    userSettings = {
      # basics
      "files.insertFinalNewline" = true;
      "editor.formatOnSave" = true;
      "update.mode" = "none";
      "window.titleBarStyle" = "custom";
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace', monospace";
      "git.openRepositoryInParentFolders" = "never";
      "window.autoDetectColorScheme" = true;
      "workbench.editor.enablePreview" = false;
      # 🦀
      "rust-analyzer.cargo.features" = "all";
      "rust-analyzer.check.command" = "clippy";
      # ❄️
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      # TODO: I hate this
      "nix.serverSettings" = {
        nil.formatting.command = ["cat"];
      };
    };
  };
}
