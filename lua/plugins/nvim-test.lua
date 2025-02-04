return {
	"klen/nvim-test",
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
		{ "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
		{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
		{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
	},
	config = function()
		require("nvim-test").setup()
	end,
}
