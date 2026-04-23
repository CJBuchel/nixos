return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("flutter-tools").setup({
				lsp = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				},
				decorations = {
					statusline = {
						app_version = true,
						device = true,
					},
				},
			})

			vim.keymap.set("n", "<leader>Fr", ":FlutterRun<CR>", { desc = "Flutter Run" })
			vim.keymap.set("n", "<leader>Fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
			vim.keymap.set("n", "<leader>FR", ":FlutterRestart<CR>", { desc = "Flutter Restart" })
			vim.keymap.set("n", "<leader>Fd", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
			vim.keymap.set("n", "<leader>Fo", ":FlutterOutlineToggle<CR>", { desc = "Flutter Outline" })
		end,
	},
}
