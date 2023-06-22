vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
vim.g['test#strategy'] = 'toggleterm'

return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>tf", "<cmd>TestFile<cr>" },
    { "<leader>tn", "<cmd>TestNearest<cr>" }
	},
  dependencies = { 'preservim/vimux' }
}
