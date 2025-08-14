return {
	"vim-test/vim-test",
	event = "VeryLazy",
	config = function()
		vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true })

		vim.g["test#strategy"] = "kitty"
		-- vim.g["test#ruby#rspec#executable"] = "bundle exec rspec"
		-- vim.g["test#ruby#rspec#options"] = "--format documentation"
	end,
}
