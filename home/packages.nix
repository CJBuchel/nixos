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

    # Dev
    rustup
    flutter
    nodejs

    # Apps
    obsidian
    spotify
  ];
}
