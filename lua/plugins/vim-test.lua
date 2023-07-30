vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
vim.g["test#strategy"] = "vimux"

return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
		{ "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
		{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
		{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
	},
	dependencies = { "preservim/vimux" },
}
