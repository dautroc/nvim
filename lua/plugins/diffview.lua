return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>gdd", "<cmd>DiffviewOpen development..head<CR>", desc = "Diffview with development" },
		{ "<leader>gdm", "<cmd>DiffviewOpen master..head<CR>", desc = "Diffview with master" },
		{ "<leader>gdq", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
		{ "<leader>gdf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview file history" },
		{ "<leader>gdf", ":'<,'>DiffviewFileHistory<CR>", desc = "Diffview file history", mode = "v" },
	},
}
