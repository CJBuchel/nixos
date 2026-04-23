{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;

    # Packages neovim needs at the system level
    extraPackages = with pkgs; [
      # Tools lazy.nvim and plugins need
      gcc
      git
      ripgrep
      fd
      stylua
    ];
  };

  # Link lua config into ~/.config/nvim
  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };
}
