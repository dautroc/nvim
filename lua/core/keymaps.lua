-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Map leader keys
vim.g.mapleader = " "
vim.b.maplocalleader = ";"

---------------------------------------
------------- Normal Mode -------------
---------------------------------------
-- Quick actions
keymap("n", "<leader>w", ":w<cr>")
keymap("n", "<leader>q", ":q<cr>")
keymap("n", "<leader>Q", ":qa<cr>")
keymap("n", "<leader><tab>", ":b#<cr>")

-- Better identation
keymap("n", ";", "==")
keymap("v", ";", "==")

-- Better move around
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Window Keymap
keymap("n", "<C-h>", "<cmd>lua require('tmux').move_left()<cr>", opts)
keymap("n", "<C-j>", "<cmd>lua require('tmux').move_down()<cr>", opts)
keymap("n", "<C-k>", "<cmd>lua require('tmux').move_up()<cr>", opts)
keymap("n", "<C-l>", "<cmd>lua require('tmux').move_right()<cr>", opts)

-- Better search and highlight
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "*zzzv", opts)
keymap("n", "#", "#zzzv", opts)
keymap("n", "<esc>", "<cmd>noh<cr>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)

-- Navigate in line
keymap("n", "<S-l>", "$", opts)
keymap("n", "<S-h>", "^", opts)

-- Clear highlights
keymap("n", "<leader>h", vim.cmd.nohlsearch, opts)

-- Netrw File Explorer
keymap("n", "<leader>.", vim.cmd.Ex, opts)

-- _LAZYGIT_TOGGLE
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

---------------------------------------
------------- Insert Mode -------------
---------------------------------------
-- Quick escape
keymap("i", "jk", "<esc>")

-- Undo break points
keymap("i", "_", "_<C-g>u", opts)
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)
keymap("i", "[", "[<C-g>u", opts)
keymap("i", "]", "]<C-g>u", opts)
keymap("i", "{", "{<C-g>u", opts)
keymap("i", "}", "}<C-g>u", opts)
keymap("i", "(", "(<C-g>u", opts)
keymap("i", ")", ")<C-g>u", opts)
keymap("i", " ", " <C-g>u", opts)

---------------------------------------
------------- Visual Mode -------------
---------------------------------------
-- Stay in indent mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)
