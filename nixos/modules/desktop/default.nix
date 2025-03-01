{ pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./sound.nix
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "de_se_fi";
      # unset to make ctrl-backspace work in gtk apps
      options = "";
    };
    excludePackages = [ pkgs.xterm ];
  };

  # WAYLAND ALL THE THINGS
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    extraTypes = [
      { type = "compiler"; nice = 10; }
      { type = "desktop"; nice = -10; }
      { type = "gui-app"; nice = -15; }
      { type = "call-app"; nice = -20; }
    ];
    extraRules = let
      desktopProcesses = [
        "gnome-shell" "Xwayland" "mutter-x11-frames" "rtkit-daemon" "gdm"
        "gnome-session-binary"
      ];
      guiApps = [
        "nautilus" "totem" "geary" "gnome-calendar" "gnome-clocks" "diebahn"
        "snapshot" "firefox" "codium" "fractal" "signal-desktop" "telegram-desktop"
        "dev.geopjr.Tuba" ".gnome-terminal" "gnome-terminal-server"
      ];
      compilers = [ "nix" "rustc" ];
    in
      map (x: { name = x; type = "desktop"; }) desktopProcesses
      ++ map (x: { name = x; type = "gui-app"; }) guiApps
      ++ map (x: { name = x; type = "compiler"; }) compilers
      ++ [{ name = ".Discord-wrapped"; type = "call-app"; }];
  };
}
