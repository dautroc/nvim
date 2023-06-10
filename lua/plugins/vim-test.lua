vim.g['test#ruby#rspec#executable'] = 'bundle exec rspec'
vim.g['test#strategy'] = 'kitty'

return {
	"vim-test/vim-test",
	keys = {
		{ "<leader>tf", ":TestFile<cr>" },
    { "<leader>tn", ":TestNearest<cr>" }
	},
  dependencies = { 'preservim/vimux' }
}
