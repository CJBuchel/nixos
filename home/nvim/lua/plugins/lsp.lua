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
				"rust_analyzer",
			},
			automatic_enable = true,
		},
	},

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
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
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
					["<Up>"] = cmp.mapping.select_prev_item(),
					["<Down>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
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

	-- LSP keymaps + diagnostics + server configs
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local caps = require("cmp_nvim_lsp").default_capabilities()

			-- ── LSP server configs ──────────────────────────────────────────────
			-- To add a permanent language:
			--   1. Add server name to ensure_installed above
			--   2. Add vim.lsp.config block here
			--   3. Add formatter to conform in editor.lua
			--   4. Add linter to nvim-lint in editor.lua (if needed)
			--   5. Add binaries to extraPackages in neovim.nix

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

			-- One-off languages (install via :Mason, remove when done):
			-- vim.lsp.config("gopls", { capabilities = caps })
			-- vim.lsp.enable("gopls")

			-- ── Diagnostics ─────────────────────────────────────────────────────
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
			})

			-- ── Keymaps ─────────────────────────────────────────────────────────
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local map = vim.keymap.set
					local opts = { buffer = ev.buf, silent = true }
					map("n", "gd", vim.lsp.buf.definition, opts)
					map("n", "K", vim.lsp.buf.hover, opts)
					map("n", "<leader>rn", vim.lsp.buf.rename, opts)
					map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
					map("n", "[d", vim.diagnostic.goto_prev, opts)
					map("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})
		end,
	},
}
