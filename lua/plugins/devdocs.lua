return {
	"luckasRanarison/nvim-devdocs",
	keys = {
		{ "<leader>do", "<cmd>DevdocsOpen<cr>", desc = "Devdocs open" },
		{ "<leader>du", "<cmd>DevdocsUpdateAll<cr>", desc = "Decdocs update all" },
		{ "<leader>df", "<cmd>DevdocsFetch<cr>", desc = "Devdocs fetch" },
		{ "<leader>di", "<cmd>DevdocsInstall<cr>", desc = "Devdocs install" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
}
