return {
	"luckasRanarison/nvim-devdocs",
  keys = {
    { "<leader>df", "<cmd>DevdocsFetch<cr>", desc = "Devdoc fetch" },
    { "<leader>di", "<cmd>DevdocsInstall<cr>", desc = "Devdoc install" },
    { "<leader>du", "<cmd>DevdocsUpdate<cr>", desc = "Devdoc update" },
    { "<leader>dU", "<cmd>DevdocsUninstall<cr>", desc = "Devdoc uninstall" },
    { "<leader>da", "<cmd>DevdocsUpdateAll<cr>", desc = "Devdoc update all" },
    { "<leader>do", "<cmd>DevdocsOpen<cr>", desc = "Devdoc open" },
  },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {},
}
