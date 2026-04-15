{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withRuby = false;
    withPython3 = false;
  };

  # LazyVim bootstrap — places init.lua into ~/.config/nvim/
  xdg.configFile."nvim/init.lua".text = ''
    -- Bootstrap lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
      local lazyrepo = "https://github.com/folke/lazy.nvim.git"
      local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        lazyrepo, lazypath
      })
      if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
          { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
          { out, "WarningMsg" },
          { "\nPress any key to continue..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
      end
    end
    vim.opt.rtp:prepend(lazypath)

    -- Basic options before LazyVim loads
    vim.g.mapleader = " "
    vim.g.maplocalleader = "\\"

    -- Setup lazy with LazyVim
    require("lazy").setup({
      spec = {
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },

        -- Tokyo Night theme
        {
          "folke/tokyonight.nvim",
          opts = { style = "night" },
        },

        -- Override the default colorscheme
        {
          "LazyVim/LazyVim",
          opts = { colorscheme = "tokyonight-night" },
        },

        -- Import any extras you want
        -- { import = "lazyvim.plugins.extras.lang.rust" },
        -- { import = "lazyvim.plugins.extras.lang.typescript" },
      },
      defaults = {
        lazy = false,
        version = false,
      },
      install = { colorscheme = { "tokyonight-night", "habamax" } },
      checker = { enabled = true },
      performance = {
        rtp = {
          disabled_plugins = {
            "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin",
          },
        },
      },
    })
  '';
}
