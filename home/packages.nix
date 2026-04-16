{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browser
    google-chrome
    firefox

    # Terminal tools
    kitty
    btop
    ripgrep
    fd
    jq
    unzip
    yazi
    fastfetch

    # Wayland / desktop
    waybar
    wofi
    hyprpaper
    hyprlock
    hypridle
    wl-clipboard
    wdisplays        # GUI monitor layout tool
    pavucontrol
    blueman
    networkmanagerapplet
    nwg-look         # GTK theme switcher UI
    imv
    thunar
    thunar-volman
    thunar-archive-plugin
    tumbler

    # Dev
    rustup
    flutter
    nodejs

    # Apps
    obsidian
    spotify
    discord
  ];
}
