{
  pkgs,
  inputs,
  ...
}: let
  workspaces = builtins.concatLists (builtins.genList (x: let
      ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
    in [
      "SUPER, ${ws}, workspace, ${toString (x + 1)}"
      "SUPER SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
    ])
    10);
in {
  home.packages = with pkgs; [
    brightnessctl
    overskride
    pavucontrol
    iio-hyprland
    jq
  ];
  wayland.windowManager.hyprland = {
    extraConfig = ''
      #-----------------------------------------
      # submap 1
      bind = SUPERSHIFT, space, submap, insert
      submap = insert
      bind = SUPERSHIFT, space, submap, reset
      bind = shift, y, exec, grimblast copysave output
      bind = shift, e, exec, nautilus -w
      bind = shift, r, exec, alacritty -e nvim ~/parlbomb
      bind = shift, d, exec, alacritty -e nvim ~/work/clones/homelab/
      bind = shift, q, exec, firefox
      bind = shift, o, exec, obsidian
      bind = shift, s, exec, spotify
      bind = shift, a, exec, alacritty
      bind = shift, p, exec, pavucontrol
      bind = shift, z, exec, google-chrome-stable --new-window
      bind = shift, b, exec, overskride

      bind = shift, c, exec, code
      bind = shift, catchall, submap, reset
      bind = super, catchall, submap, reset
      bind = , escape, submap, reset

      submap = reset
    '';
    settings = {
      bindm = ["super,mouse:272,movewindow" "supershift, mouse:272, resizewindow" "super,mouse:273,resizewindow"];
      # wm commands
      bind =
        [
          # grouping
          "alt, tab, swapnext"
          "super, x, moveoutofgroup"
          "super control,z, togglegroup,"
          "super shift, z, changegroupactive, f"
          "super, z, changegroupactive, b"
          # window focusing
          "super, mouse_down, workspace, -1"
          "super, mouse_up, workspace, +1"
          "super shift, tab, focusmonitor, next"
          # window mgmt
          "super, q, killactive"
          "super, f, fullscreen"
          "super, r, togglesplit"
          "super, p, pseudo"
          "super, o, togglefloating"
          "super shift, f, fullscreen,1"
          "super, p, pin"
          "super, left, movewindow,l"
          "super, right, movewindow,r"
          # vim kb
          "super, h, movefocus, l"
          "super, j, movefocus, d"
          "super, k, movefocus, u"
          "super, l, movefocus, r"
          "supershift, h, movewindow, l"
          "supershift, j, movewindow, d"
          "supershift, k, movewindow, u"
          "supershift, l, movewindow, r"
          # programs
          "supershift, tab, exec, swaync-client -t"
          "super, escape, exec, hyprlock"
          "super, e, exec, nautilus --new-window"
          "super, n, exec, alacritty"
          "super, v, exec, alacritty --class clipse -e 'clipse'"
          "super, b, exec, firefox"
          #special workspaces
          "super, grave, togglespecialworkspace, discord"
          "super, tab, exec, pgrep spotify && hyprctl dispatch togglespecialworkspace spotify || spotify &"
          "super, m, exec, kitty"
          # screenshotting
          "super, s, exec, grimblast copysave area"
          #volume
          ", xf86audioplay, exec, playerctl play-pause"
          ", xf86audiopause, exec, playerctl play-pause"
          ", xf86audiomute,exec, swayosd-client --output-volume mute-toggle "
          ",xf86audionext, exec, playerctl next"
          ", xf86audioprev, exec, playerctl previous"

          # "supershift, a, hyprexpo:expo,toggle"
        ]
        ++ workspaces;
      binde = [
        ",xf86audioraisevolume, exec, swayosd-client --output-volume raise"
        ",xf86audiolowervolume, exec, swayosd-client --output-volume lower"
        ",xf86monbrightnessup, exec, brightnessctl s +5%"
        ",xf86monbrightnessdown, exec, brightnessctl s 5%-"
      ];
      bindl = [
        ", switch:[intel hid switches], exec, alacritty"
      ];
    };
  };
}
