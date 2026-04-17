return {
  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          sorting_strategy = "ascending",
          layout_config = { prompt_position = "top" },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },

  -- Formatting infrastructure
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        -- formatters_by_ft is populated in languages.lua
        formatters_by_ft = {},
        format_on_save = {
          timeout_ms = 2000,
          lsp_format = "fallback",
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>gf", function()
        conform.format({ async = true })
      end, { desc = "Format file" })
    end,
  },

  -- Linting infrastructure
  {

    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- linters_by_ft is populated in languages.lua
      lint.linters_by_ft = {}

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Git signs
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
      },
    },
  },

  -- Git UI
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {},
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    opts = {},
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        direction = "horizontal",
        shade_terminals = true,
        shading_factor = 2,
        start_insert = true,
        persist_mode = true,
      })

      -- Ctrl+` to toggle like Zed/VSCode
      vim.keymap.set({ "n", "t" }, "<C-`>", "<cmd>ToggleTerm<CR>", { silent = true })

      -- Escape to go back to normal mode while in terminal
      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })
    end,
  },
}
