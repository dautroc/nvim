vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
vim.g['test#strategy'] = 'toggleterm'

return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
    { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Test Nearest" }
	},
  dependencies = { 'preservim/vimux' }
}
