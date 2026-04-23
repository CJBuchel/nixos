return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false,
		build = "make",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"hrsh7th/nvim-cmp",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
		opts = {
			provider = "claude",
			input = {
				provider = "native",
			},
			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-20250514",
					auth_type = "max", -- uses Claude Pro/Max subscription via browser auth
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
				-- Future local AI option:
				-- ollama = {
				--   model = "llama3",
				--   is_env_set = require("avante.providers.ollama").check_endpoint_alive,
				-- },
			},
			windows = {
				position = "right",
				width = 35,
			},
			behaviour = {
				auto_suggestions = false,
				auto_add_current_file = true,
			},
		},
		keys = {
			{ "<C-A-b>", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante sidebar" },
			{ "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Avante ask" },
			{ "<leader>ae", "<cmd>AvanteEdit<CR>", mode = { "n", "v" }, desc = "Avante edit selection" },
		},
	},
}
