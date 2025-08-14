{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "size 50% 55%, class:^(Alacritty)$,floating: 1"
      "center, class:^(Alacritty)$, floating: 1"
      "float, title:^(Picture-in-Picture)$"
      "pin, title:^(Picture-in-Picture)$"
      "float, class:^(imv)$"
      "workspace special:discord silent,class:^(WebCord)$"
      "workspace special:discord silent,class:^(discord)$"
      "workspace special:spotify silent,initialTitle:^(Spotify Free|Spotify Premium)$"
      "float,class:(qalculate-gtk)"
      "workspace special:calculator,class:(qalculate-gtk)"
      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"
      "float,class:(clipse)" # ensure you have a floating window class set if you want this behaviour
      "size 422 452,class:(clipse)" # set the size of the window as necessary
      "pin, class:(clipse)"
      "stayfocused, class:(Anyrun)"
      "rounding 0, floating:0, onworkspace:w[t1]"
      "bordersize 0, floating:0, onworkspace:w[tg1]"
      "rounding 0, floating:0, onworkspace:w[tg1]"
      "bordersize 0, floating:0, onworkspace:f[1]"
      "rounding 0, floating:0, onworkspace:f[1]"
    ];
    layerrule = let
      layers = "^(anyrun|gtk-layer-shell|swayosd)$";
    in ["blur, ${layers}" "ignorealpha 0.2, ${layers}"];
  };
}
