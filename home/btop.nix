{ ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "tokyo-night";
      theme_background = false;
      vim_keys = true;
      rounded_corners = true;
      update_ms = 1000;
    };
  };

  # Tokyo Night theme file
  xdg.configFile."btop/themes/tokyo-night.theme".text = ''
    theme[main_bg]="#1a1b26"
    theme[main_fg]="#c0caf5"
    theme[title]="#7aa2f7"
    theme[hi_fg]="#7aa2f7"
    theme[selected_bg]="#292e42"
    theme[selected_fg]="#c0caf5"
    theme[inactive_fg]="#414868"
    theme[graph_text]="#c0caf5"
    theme[meter_bg]="#292e42"
    theme[proc_misc]="#7dcfff"
    theme[cpu_box]="#3b4261"
    theme[mem_box]="#3b4261"
    theme[net_box]="#3b4261"
    theme[proc_box]="#3b4261"
    theme[div_line]="#3b4261"
    theme[temp_start]="#9ece6a"
    theme[temp_mid]="#e0af68"
    theme[temp_end]="#f7768e"
    theme[cpu_start]="#9ece6a"
    theme[cpu_mid]="#e0af68"
    theme[cpu_end]="#f7768e"
    theme[free_start]="#9ece6a"
    theme[free_mid]="#e0af68"
    theme[free_end]="#f7768e"
    theme[download_start]="#7aa2f7"
    theme[download_mid]="#bb9af7"
    theme[download_end]="#7dcfff"
    theme[upload_start]="#7aa2f7"
    theme[upload_mid]="#bb9af7"
    theme[upload_end]="#7dcfff"
    theme[process_start]="#7aa2f7"
    theme[process_mid]="#bb9af7"
    theme[process_end]="#7dcfff"
  '';
}
