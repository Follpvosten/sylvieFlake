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
      "browser.uiCustomization.state" = builtins.toJSON {
        "placements" = {
          "widget-overflow-fixed-list" = [];
          "unified-extensions-area" = [];
          "nav-bar" = [
              "back-button"
              "forward-button"
              "stop-reload-button"
              "home-button"
              "urlbar-container"
              "downloads-button"
              "unified-extensions-button"
              "ublock0_raymondhill_net-browser-action"
              # why is bitwarden called that???
              "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
          ];
          "toolbar-menubar" = [
              "menubar-items"
          ];
          "TabsToolbar" = [
              "tabbrowser-tabs"
              "new-tab-button"
              "alltabs-button"
          ];
          "PersonalToolbar" = [
              "import-button"
              "personal-bookmarks"
          ];
        };
        "seen" = [
            "developer-button"
            "ublock0_raymondhill_net-browser-action"
            "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
        ];
        "dirtyAreaCache" = [
            "nav-bar"
            "PersonalToolbar"
            "toolbar-menubar"
            "TabsToolbar"
            "unified-extensions-area"
        ];
        "currentVersion" = 20;
        "newElementCount" = 3;
      };
    };
    extensions = with config.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
      consent-o-matic
    ];
  };
}
