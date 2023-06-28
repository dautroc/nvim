-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Map leader keys
vim.g.mapleader = " "
vim.b.maplocalleader = ";"

-- Quick actions
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit file" })
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all files" })
keymap("n", "<leader><tab>", "<cmd>b#<cr>", { desc = "Switch to last buffer" })
keymap("n", "<leader>R", "<cmd>!ctags -R --languages=ruby<cr>", { desc = "Update ctags" })

-- Quickfix list
keymap("n", "cn", "<cmd>cnext<cr>")
keymap("n", "cp", "<cmd>cprev<cr>")
keymap("n", "cc", "<cmd>cclose<cr>")
keymap("n", "co", "<cmd>copen<cr>")

-- Ctags jumps
keymap("n", "<leader>c", "g<C-]>", { desc = "Jump to tag" })

-- Better identation
keymap("n", "<leader>ma", "==", { desc = "Auto identation" })
keymap("v", "<leader>ma", "==", { desc = "Auto identation" })

-- Better move around
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Window Keymap
keymap({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")

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
keymap({ "n", "v" }, "<S-l>", "$", opts)
keymap({ "n", "v" }, "<S-h>", "^", opts)

-- Clear highlights
keymap("n", "<leader>h", vim.cmd.nohlsearch, { desc = "Clear highlights" })

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

-- Stay in indent mode
keymap("x", "<", "<gv", opts)
keymap("x", ">", ">gv", opts)
