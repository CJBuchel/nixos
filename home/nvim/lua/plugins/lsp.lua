return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "ts_ls",
      },
      -- automatically calls vim.lsp.enable() for installed servers
      automatic_enable = true,
    },
  },

  -- Still needed in runtimepath for server definitions
  { "neovim/nvim-lspconfig" },

  -- Completions
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Up>"]      = cmp.mapping.select_prev_item(),
          ["<Down>"]    = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"]     = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- LSP configuration using native API
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = caps,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        capabilities = caps,
      })

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      vim.api.nvim_create_autocmd({
        callback = function(ev)
          local map = vim.keymap.set
          local opts = { buffer = ev.buf, silent = true }
          map("n", "gd",         vim.lsp.buf.definition,   opts)
          map("n", "K",          vim.lsp.buf.hover,        opts)
          map("n", "<leader>rn", vim.lsp.buf.rename,       opts)
          map("n", "<leader>ca", vim.lsp.buf.code_action,  opts)
          map("n", "<leader>f",  vim.lsp.buf.format,       opts)
          map("n", "[d",         vim.diagnostic.goto_prev, opts)
          map("n", "]d",         vim.diagnostic.goto_next, opts)
        end,
      }, "LspAttach")
    end,
  },
}
