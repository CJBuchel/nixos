{ ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      # Video
      profile = "gpu-hq";
      hwdec = "auto-safe";
      vo = "gpu";
      gpu-api = "vulkan";

      # UI
      osc = true;
      osd-bar = true;
      osd-font = "JetBrainsMono Nerd Font";
      osd-font-size = 24;
      osd-color = "#c0caf5";
      osd-border-color = "#1a1b26";
      osd-bar-align-y = -1;
      osd-bar-h = 2;

      # Subtitles
      sub-auto = "fuzzy";
      sub-font = "Inter";
      sub-font-size = 36;
      sub-color = "#c0caf5";
      sub-border-color = "#1a1b26";
      sub-border-size = 2;
      sub-shadow-offset = 1;

      # Behaviour
      keep-open = true;
      save-position-on-quit = true;
    };

    bindings = {
      "l" = "seek 5";
      "h" = "seek -5";
      "j" = "seek -60";
      "k" = "seek 60";
      "m" = "cycle mute";
      "f" = "cycle fullscreen";
    };
  };
}
