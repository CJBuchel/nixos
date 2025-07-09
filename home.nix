{ config, pkgs, ... }:

{
  home.username = "cj";
  home.homeDirectory = "/home/cj";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    kitty
    neovim
    zsh-powerlevel10k
    yazi
    hyprpaper
    btop
  ];

  gtk = {
    enable = true;
    # Dracula GTK theme (supports GTK2, GTK3, GTK4)
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    
    # Dracula-compatible icon theme
    iconTheme = {
      package = pkgs.dracula-icon-theme;
      name = "Dracula";
    };
    
    # Dracula cursor theme
    cursorTheme = {
      package = pkgs.dracula-theme;
      name = "Dracula-cursors";
      size = 24;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  programs.kitty = {
    enable = true;
    themeFile = "tokyo_night_night";
    settings = {
      font_family = "JetBrainsMono Nerd Font";
      font_size = 11;
      background_opacity = "0.85";
    };
  };
  
  home.file.".p10k.zsh".text = builtins.readFile ./p10k.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;    

    initContent = ''
      source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme"
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';

    shellAliases = {
      nrs = "sudo nixos-rebuild switch";
    };
  };

  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      
      # Dracula color variables (for consistency)
      "$dracula-bg" = "0xff282a36";
      "$dracula-current" = "0xff44475a";
      "$dracula-foreground" = "0xfff8f8f2";
      "$dracula-pink" = "0xffff79c6";      # #ff79c6
      "$dracula-purple" = "0xffbd93f9";    # #bd93f9
      "$dracula-cyan" = "0xff8be9fd";      # #8be9fd
      
      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;

        "col.active_border" = "$dracula-pink $dracula-purple 45deg";
        "col.inactive_border" = "$dracula-current";
      };

      exec-once = [
        "hyprpaper"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi --show drun";

      "$mainMod" = "SUPER";
      
      bind = [
        "$mainMod, T, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, toggleFloating,"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
  
  # Wallpaper
  home.file."wallpaper.jpg".source = ./wallpapers/wallpaper.jpg;
  services.hyprpaper = {
    enable = true;
    settings = {  
      splash = false;
      preload = [
        "wallpaper.jpg"
      ];

      wallpaper = [
        ",wallpaper.jpg"
      ];
    };
  };
}
