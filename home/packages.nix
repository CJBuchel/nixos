{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # browser
    google-chrome
    firefox

    # terminal tools
    kitty
    ripgrep
    fd
    jq
    unzip
    yazi
    fastfetch

    # wayland / desktop
    waybar
    wofi
    hyprpaper
    hyprlock
    hypridle
    wl-clipboard
    wdisplays        # gui monitor layout tool
    pavucontrol
    blueman
    networkmanagerapplet
    nwg-look         # gtk theme switcher ui
    imv
    thunar
    thunar-volman
    thunar-archive-plugin
    tumbler

    # dev
    claude-code

    # apps
    obsidian
    spotify
    discord
  ];
}
