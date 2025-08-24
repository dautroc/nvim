return {
	"williamboman/mason.nvim",
  enabled = true,
	cmd = "Mason",
	keys = {
		{ "<leader>M", "<cmd>Mason<CR>", desc = "Opens Mason" },
	},
	opts = {
		ui = {
			border = "rounded",
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		log_level = vim.log.levels.INFO,
		max_concurrent_installers = 4,
	},
}
