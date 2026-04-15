{ config, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./shell.nix
    ./hyprland.nix
    ./waybar.nix
    ./kitty.nix
    ./neovim.nix
    ./theme.nix
  ];

  home.username = "cj";
  home.homeDirectory = "/home/cj";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
