vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
vim.g['test#strategy'] = 'toggleterm'

return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>rT", "<cmd>TestFile<cr>", desc = "Test file" },
    { "<leader>rt", "<cmd>TestNearest<cr>", desc = "Test nearest" }
	},
  dependencies = { 'preservim/vimux' }
}
