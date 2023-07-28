vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
vim.g["test#strategy"] = "dispatch"

return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>rtf", "<cmd>TestFile<cr>", desc = "Test file" },
		{ "<leader>rtn", "<cmd>TestNearest<cr>", desc = "Test nearest" },
		{ "<leader>rtl", "<cmd>TestLast<cr>", desc = "Test last" },
		{ "<leader>rtv", "<cmd>TestVisit<cr>", desc = "Test visit" },
	},
	dependencies = { "preservim/vimux" },
}
