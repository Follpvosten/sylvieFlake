{ pkgs, ... }:
{
  imports = [
    ./gnome.nix
    ./sound.nix
  ];

  # WAYLAND ALL THE THINGS
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-cpp;
    extraTypes = [
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
        "kgx" "nautilus" "totem" "geary" "gnome-calendar" "gnome-clocks" "diebahn"
        "snapshot" "firefox" "codium" "fractal" "signal-desktop" "telegram-desktop"
        "dev.geopjr.Tuba"
      ];
    in
      map (x: { name = x; type = "desktop"; }) desktopProcesses
      ++ map (x: { name = x; type = "gui-app"; }) guiApps
      ++ [{ name = ".Discord-wrapped"; type = "call-app"; }];
  };
}
