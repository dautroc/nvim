require('hop').setup()

vim.api.nvim_set_keymap('n', '<Tab>', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<c-l>', "<cmd>lua require'hop'.hint_lines()<cr>", {})
vim.api.nvim_set_keymap('v', '<c-l>', "<cmd>lua require'hop'.hint_lines()<cr>", {})
