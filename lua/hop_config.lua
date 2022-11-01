require'hop'.setup {
  multi_windows = true,
	keys = 'etovxqpdygfblzhckisuran'
}

vim.api.nvim_set_keymap('n', '<Tab>', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<c-l>', "<cmd>lua require'hop'.hint_lines()<cr>", {})
