{
  pkgs,
  config,
  ...
}: {
  home = {
    sessionVariables.GTK_THEME = "Everforest-Dark-Medium-BL";
    packages = with pkgs; [dconf];
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {color-scheme = "prefer-dark";};
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
      name = "MacTahoe-Dark";
      package = pkgs.mactahoe-theme;
    };
    iconTheme = {
      name = "MacTahoe";
      package = pkgs.mactahoe-icons;
    };
    font = {
      name = "Fira Sans";
    };
  };
}
