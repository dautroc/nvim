return {
	"williamboman/mason.nvim",
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
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			event = "BufReadPre",
			config = function()
				require("mason").setup()
				require("mason-lspconfig").setup()
			end,
			opts = {
				ensure_installed = require("utils").servers,
				automatic_installation = true,
			},
		},
	},
}
