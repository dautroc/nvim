return {
	"sindrets/diffview.nvim",
	cmd = {
		"DiffviewFileHistory",
		"DiffviewOpen",
		"DiffviewToggleFiles",
		"DiffviewFocusFiles",
		"DiffviewRefresh",
	},
	keys = {
		{ "<leader>gdo", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
		{ "<leader>gdq", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
		{ "<leader>gdf", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview file history" },
		{ "<leader>gdf", ":'<,'>DiffviewFileHistory<CR>", desc = "Diffview file history", mode = "v" },
	},
}
