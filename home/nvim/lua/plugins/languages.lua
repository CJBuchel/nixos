-- Per-language configuration lives here.
--
-- To add a PERMANENT language (always installed on any machine):
--   1. Add LSP server name to lsp_servers
--   2. Add vim.lsp.config block in the cmp-nvim-lsp config section
--   3. Add formatter to conform_formatters
--   4. Add linter to lint_filetypes (if applicable)
--   5. Add formatter/linter binaries to extraPackages in neovim.nix
--
-- To add a ONE-OFF language (just exploring, this machine only):
--   1. Install LSP via :Mason (find and press i)
--   2. Add vim.lsp.config block and vim.lsp.enable() call below in the
--      "one-off" section — this is the only file you need to touch
--   3. When done, remove the vim.lsp.config block and uninstall via :Mason

local conform_formatters = {
  lua        = { "stylua" },
  javascript = { "prettier" },
  typescript = { "prettier" },
  json       = { "prettier" },
  css        = { "prettier" },
  html       = { "prettier" },
  rust       = { "rustfmt" },
  dart       = { "dart_format" },
}

local lint_filetypes = {
  javascript = { "eslint" },
  typescript = { "eslint" },
}

local lsp_servers = {
  "lua_ls",
  "ts_ls",
  -- "rust_analyzer",
  -- "dartls",
}

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(
        opts.ensure_installed or {},
        lsp_servers
      )
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = vim.tbl_extend(
        "force",
        opts.formatters_by_ft or {},
        conform_formatters
      )
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_extend(
        "force",
        opts.linters_by_ft or {},
        lint_filetypes
      )
    end,
  },

  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()

      -- ── Permanent languages ─────────────────────────────────────────────

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

      -- vim.lsp.config("rust_analyzer", { capabilities = caps })
      -- vim.lsp.config("dartls",        { capabilities = caps })

      -- ── One-off languages (install via :Mason, remove when done) ────────
      -- Example: Go
      --   1. Run :Mason, find gopls, press i to install
      --   2. Uncomment below
      --   3. When done, recomment and uninstall via :Mason
      --
      -- vim.lsp.config("gopls", { capabilities = caps })
      -- vim.lsp.enable("gopls")
    end,
  },
}
