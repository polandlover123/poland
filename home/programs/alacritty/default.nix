{
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "JetbrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetbrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetbrainsMono Nerd Font";
          style = "Italic";
        };
      };
      window = {
        padding = {
          x = 15;
          y = 15;
        };
      };
      cursor.style = "Beam";
      cursor = {
        thickness = 0.20;
        unfocused_hollow = true;
      };
      colors.primary = {
        background = "#161616";
        foreground = "#ffffff";
      };
      colors.search.matches = {
        foreground = "CellBackground";
        background = "#ee5396";
      };
      colors.normal = {
        black = "#151515";
        magenta = "#a988b0";
        green = "#8c977d";
        yellow = "#d9bc8c";
        blue = "#8da3b9";
        red = "#b66467";
        cyan = "#8aa6a2";
        white = "#e8e3e3";
      };
      colors.bright = {
        black = "#424242";
        magenta = "#a988b0";
        green = "#8c977d";
        yellow = "#d9bc8c";
        blue = "#8da3b9";
        red = "#b66467";
        cyan = "#8aa6a2";
        white = "#e8e3e3";
      };
    };
  };
}
