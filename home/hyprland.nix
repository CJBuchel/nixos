{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      # Monitors — run `hyprctl monitors` to get names, then set via kanshi
      # Left here as fallback, kanshi will override
      monitor = [ ",3840x2160@240,auto,auto" ];

      # Autostart
      exec-once = [
        "waybar"
        "nm-applet --indicator"
        "blueman-applet"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "GTK_THEME,Tokyonight-Dark"
        "QT_QPA_PLATFORM,wayland"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(82aaffee)";
        "col.inactive_border" = "rgba(1d3b53aa)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 6;
          passes = 2;
          new_optimizations = true;
          xray = false;
          ignore_opacity = false;
        };
        shadow = {
          enabled = true;
          range = 12;
          color = "rgba(01162799)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];
        animation = [
          "global,        1, 10,   default"
          "border,        1, 5.39, easeOutQuint"
          "windows,       1, 4.79, easeOutQuint"
          "windowsIn,     1, 4.1,  easeOutQuint, popin 87%"
          "windowsOut,    1, 1.49, linear,       popin 87%"
          "fadeIn,        1, 1.73, almostLinear"
          "fadeOut,       1, 1.46, almostLinear"
          "fade,          1, 3.03, quick"
          "layers,        1, 3.81, easeOutQuint"
          "layersIn,      1, 4,    easeOutQuint, fade"
          "layersOut,     1, 1.5,  linear,       fade"
          "fadeLayersIn,  1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear" "workspaces,    1, 1.94, almostLinear, fade"
          "workspacesIn,  1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor,    1, 7,    quick"
        ];
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad.natural_scroll = false;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      windowrulev = [
        "noborder, class:^(wofi)$"
        "rounding 0, class:^(wofi)$"
      ];

      # Keybinds — $mod = Super key
      "$mod" = "SUPER";

      bind = [
        "$mod, T, exec, kitty"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, E, exec, thunar"
        "$mod, V, togglefloating"
        "$mod, R, exec, wofi --show drun"
        "$mod, P, pseudo"
        "$mod, J, togglesplit"
        "$mod, F, fullscreen"
        "$mod, L, exec, hyprlock"

        # Move focus
        "$mod, left,  movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up,    movefocus, u"
        "$mod, down,  movefocus, d"
        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"

        # Scroll workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up,   workspace, e-1"

        # Screenshot
        ", Print, exec, hyprshot -m output"
        "SHIFT, Print, exec, hyprshot -m region"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      # Volume keys
      bindel = [
        ", XF86AudioRaiseVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume,  exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute,         exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];

      windowrule = [
        "opacity 0.92 0.85, match:class kitty"
        "opacity 0.95 0.90, match:class thunar"
        "opacity 0.95 0.90, match:class wofi"
        "opacity 1.0 1.0,   match:class firefox"
        "opacity 1.0 1.0,   match:class steam"
        "opacity 1.0 1.0,   match:class mpv"
      ]; 
    };
  };
}
