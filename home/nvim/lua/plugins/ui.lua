return {
  -- Tokyo Night theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
    config = function()
      vim.cmd("colorscheme tokyonight-night")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  -- File tree (Ctrl+B)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = { width = 30 },
      filesystem = {
        follow_current_file = { enabled = true },
        hide_dotfiles = false,
      },
    },
  },

  -- Bufferline (tabs at top)
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        separator_style = "thin",
      },
    },
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
}
