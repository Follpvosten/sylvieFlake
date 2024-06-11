{ ... }:
{
  programs.firefox.enable = true;
  programs.firefox.profiles."default-sylvie" = {
    id = 0;
    name = "default";
    path = "lu044f5h.default";
    search.order = [ "DuckDuckGo" ];
    search.force = true;
    settings = {
      "browser.startup.homepage" = "https://start.duckduckgo.com";
      "browser.newtabpage.enabled" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.tabs.insertAfterCurrent" = true;
    };
  };
}
