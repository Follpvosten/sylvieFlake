{ config, ... }:
{
  programs.firefox.enable = true;
  programs.firefox.profiles."default-sylvie" = {
    id = 0;
    name = "default";
    path = "lu044f5h.default";
    search = {
      force = true;
      default = "DuckDuckGo";
      order = [ "DuckDuckGo" ];
      engines."Google".metaData.hidden = true;
    };
    settings = {
      "browser.startup.homepage" = "https://start.duckduckgo.com";
      "browser.newtabpage.enabled" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.tabs.insertAfterCurrent" = true;
      "extensions.autoDisableScopes" = 0;
      "extensions.pocket.enabled" = false;
      "identity.fxaccounts.enabled" = false;
      "identity.fxaccounts.toolbar.enabled" = false;
      "browser.warnOnQuitShortcut" = false;
      "layout.spellcheckDefault" = 0;
      "intl.locale.requested" = "de,en-US";
      "intl.regional_prefs.use_os_locales" = true;
      "datareporting.healthreport.uploadEnabled" = false;
      "browser.translations.automaticallyPopup" = false;
      "browser.uiCustomization.state" = builtins.toJSON (import ./uiconfig.nix);
    };
    extensions = with config.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      consent-o-matic
      simple-tab-groups
    ];
  };
}
