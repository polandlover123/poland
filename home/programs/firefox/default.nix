{
  home.file.".mozilla/firefox/admin/chrome/MacTahoe".source = ./MacTahoe;
  home.file.".mozilla/firefox/admin/chrome/customChrome.css".source = ./customChrome.css;

  programs.firefox = {
    enable = true;
    profiles.admin = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "browser.uidensity" = 0;
        "layers.acceleration.force-enabled" = true;
        "mozilla.widget.use-argb-visuals" = true;
        "widget.gtk.rounded-bottom-corners.enabled" = true;
        "svg.context-properties.content.enabled" = true;
      };
      userChrome = ''
        @import "MacTahoe/theme-adaptive.css";
        @import "MacTahoe/hide-single-tab.css";
      '';
      userContent = ''
        @import "MacTahoe/colors/light-adaptive.css";
        @import "MacTahoe/colors/dark-adaptive.css";
        @import "MacTahoe/pages/newtab-adaptive.css";
      '';
    };
  };
}