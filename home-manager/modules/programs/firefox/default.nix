{ pkgs, ... }:
{
  programs.librewolf.enable = true;
  programs.librewolf.profiles."default-sylvie" = {
    id = 0;
    name = "default";
    path = "lu044f5h.default";
    search = {
      force = true;
      default = "ddg";
      order = [ "ddg" ];
      engines.google.metaData.hidden = true;
    };
    settings = {
      "browser.startup.homepage" = "https://start.duckduckgo.com";
      "browser.newtabpage.enabled" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.tabs.insertAfterCurrent" = true;
      "extensions.autoDisableScopes" = 0;
      "browser.warnOnQuitShortcut" = false;
      "layout.spellcheckDefault" = 0;
      "intl.locale.requested" = "de,en-US";
      "intl.regional_prefs.use_os_locales" = true;
      "browser.translations.automaticallyPopup" = false;
      "browser.uiCustomization.state" = builtins.toJSON (import ./uiconfig.nix);
      # disable the super strict mode
      "privacy.resistFingerprinting" = false;
      # re-enable fingerprinting protection features
      "privacy.fingerprintingProtection" = true;
      # ...all except for light/dark theme switch
      "privacy.fingerprintingProtection.overrides" = "+AllTargets,-CSSPrefersColorScheme";
    };
    extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      consent-o-matic
      simple-tab-groups
      auto-tab-discard
      multi-account-containers
    ];
  };
}
