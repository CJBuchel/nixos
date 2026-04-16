{ pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 0;
      };

      background = [
        {
          monitor = "";
          color = "rgba(1a1b26ff)";
          blur_passes = 3;
          blur_size = 8;
          brightness = 0.6;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 48";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.2;
          outer_color = "rgb(3b4261)";
          inner_color = "rgb(16161e)";
          font_color = "rgb(c0caf5)";
          fade_on_empty = true;
          placeholder_text = "<i>Password...</i>";
          check_color = "rgb(7aa2f7)";
          fail_color = "rgb(f7768e)";
          fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
          capslock_color = "rgb(e0af68)";
          position = "0, -80";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Clock
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%H:%M")"'';
          color = "rgba(c0caf5ff)";
          font_size = 72;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 80";
          halign = "center";
          valign = "center";
        }
        # Date
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %d %B")"'';
          color = "rgba(a9b1d6ff)";
          font_size = 18;
          font_family = "Inter";
          position = "0, 10";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "hyprlock";
      };

      listener = [
        {
          timeout = 300;  # 5 min — lock
          on-timeout = "hyprlock";
        }
        {
          timeout = 360;  # 6 min — screens off
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800; # 30 min — suspend
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
