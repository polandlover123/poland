{
  pkgs,
  config,
  ...
}: {
  home = {
    sessionVariables.GTK_THEME = "WhiteSur-Dark";
    packages = with pkgs; [dconf];
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "WhiteSur-Dark";
        color-scheme = "prefer-dark";
      };
      "org/gtk/settings/file-chooser" = {
        sort-directories-first = true;
      };
    };
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 22;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      name = "WhiteSur-Dark";
      package = pkgs.whitesur-gtk-theme.override {
        nautilusStyle = "glassy";
        darkerColor = true;
        roundedMaxWindow = true;
      };
    };
    iconTheme = {
      name = "MacTahoe";
      package = pkgs.mactahoe-icons;
    };
    font = {
      name = "SF-Pro Display";
      size = 12;
      package = pkgs.sf-pro;
    };
  };
}
