{ ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
    settings = {
      # Tokyo Night / Night Owl feel
      background            = "#011627";
      foreground            = "#d6deeb";
      selection_background  = "#1d3b53";
      selection_foreground  = "#d6deeb";

      color0  = "#011627"; color8  = "#575656";
      color1  = "#ef5350"; color9  = "#ef5350";
      color2  = "#addb67"; color10 = "#addb67";
      color3  = "#ffcb8b"; color11 = "#ffcb8b";
      color4  = "#82aaff"; color12 = "#82aaff";
      color5  = "#c792ea"; color13 = "#c792ea";
      color6  = "#7fdbca"; color14 = "#7fdbca";
      color7  = "#d6deeb"; color15 = "#ffffff";

      cursor                = "#d6deeb";
      cursor_blink_interval = "0";
      window_padding_width  = "8";
      confirm_os_window_close = "0";
      scrollback_lines      = "10000";
    };
    extraConfig = ''
      tab_bar_style       powerline
      tab_powerline_style slanted
    '';
  };
}

