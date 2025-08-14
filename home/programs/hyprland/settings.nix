# ./hyprland.nix
{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "spotify"
        "webcord"
        "swww-daemon"
        "swayosd-server"
        "${pkgs.clipse}/bin/clipse -listen"
        "hyprctl setcursor macOS 22"
      ];
      animations.enabled = false;
      binds = {
        workspace_center_on = 1;
        scroll_event_delay = 15;
      };
      monitor =
        lib.mapAttrsToList (name: m: let
          resolution = "${toString m.width}x${toString m.height}@${
            toString m.refreshRate
          }";
          position = "${toString m.x}x${toString m.y}";
        in "${name},${
          if m.enabled
          then "${resolution},${position},1"
          else "disable"
        }")
        config.monitors;
      debug = {disable_logs = false;};
      cursor = {no_hardware_cursors = true;};
      general = {
        resize_corner = 3;
        snap = {
          enabled = true;
          border_overlap = true;
        };
        resize_on_border = true;
        extend_border_grab_area = 30;
        hover_icon_on_border = false;
        gaps_in = 5;
        gaps_out = 10;
        border_size = 0;
        layout = "dwindle";
      };
      input = {
        special_fallthrough = true;
        repeat_rate = 75;
        repeat_delay = 200;
        accel_profile = "flat";
        kb_layout = "us";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
          drag_lock = true;
          clickfinger_behavior = true;
        };
        sensitivity = 0;
      };
      gestures = {
        workspace_swipe_cancel_ratio = 0.15;
        workspace_swipe = true;
      };
      group = {
        groupbar = {
          "col.active" = "rgb(FFAF5F)";
          "col.inactive" = "rgb(262626)";
          enabled = true;
          render_titles = false;
          height = 0;
        };
      };
      decoration = {
        shadow = {
          enabled = true;
          range = 4;
          render_power = 4;
          color = "rgb(161616)";
        };
        rounding = 20;
        blur = {
          passes = 3;
          size = 8;
          xray = true;
          special = true;
          brightness = 0.5;
        };
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        special_scale_factor = 0.9;
      };
      xwayland = {force_zero_scaling = true;};
      misc = {
        allow_session_lock_restore = true;
        close_special_on_empty = true;
        disable_hyprland_logo = 2;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "(foot|kitty|Alacritty)";
        new_window_takes_over_fullscreen = 2;
        initial_workspace_tracking = 1;
        middle_click_paste = false;
      };
    };
  };
}
