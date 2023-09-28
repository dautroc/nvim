vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
vim.g["test#strategy"] = "toggleterm"

return {
	"vim-test/vim-test",
  enabled = true,
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
		{ "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
		{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
		{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
	},
}
