{
  programs.firefox = {
    enable = true;
    profiles = {
      admin = {
        settings = {
          "browser.tabs.drawInTitlebar" = true;
          "browser.uidensity" = 0;
          "layers.acceleration.force-enabled" = true;
          "mozilla.widget.use-argb-visuals" = true;
          "widget.gtk.rounded-bottom-corners.enabled" = true;
          "svg.context-properties.content.enabled" = true;
        };
      };
    };
  };
}
