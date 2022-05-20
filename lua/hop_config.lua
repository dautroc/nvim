require('hop').setup()

vim.api.nvim_set_keymap('n', '<Tab>', "<cmd>lua require'hop'.hint_words()<cr>", {})
