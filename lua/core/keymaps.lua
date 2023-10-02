-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Map leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Quick actions
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>x", "<C-w>s", { desc = "Split" })
keymap("n", "<leader>v", "<C-w>v", { desc = "Vsplit" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit file" })
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all files" })

-- Layout
keymap("n", "<leader>ll", "<cmd>Telescope telescope-tabs list_tabs<cr>", { desc = "List layouts" })
keymap("n", "<leader>la", "<cmd>tabnew<cr>", { desc = "Add layout" })
keymap("n", "<leader>ln", "<cmd>tabnext<cr>", { desc = "Next layout" })
keymap("n", "<leader>lp", "<cmd>tabprev<cr>", { desc = "Previous layout" })
keymap("n", "<leader>lx", "<cmd>tabclose<cr>", { desc = "Close layout" })

-- Custom functions
keymap("n", "<leader>ms", "<cmd>lua require('core.functions').say_word()<cr>", { desc = "Say word" })
keymap("n", "dd", ":lua require('core.functions').smart_delete()<CR>", { noremap = true, silent = true })

-- Buffers
keymap("n", "<leader>bb", '<cmd>let @+ = expand("%")<cr>', { desc = "Copy buffer path" })
keymap(
	"n",
	"<leader>bl",
	[[<cmd>let @+ = join([expand('%'),  line(".")], ':')<cr>]],
	{ desc = "Copy buffer path with line number" }
)

-- Quickfix list
keymap("n", "<leader>cn", "<cmd>cnext<cr>")
keymap("n", "<leader>cp", "<cmd>cprev<cr>")
keymap("n", "<leader>co", "<cmd>copen<cr>")
keymap("n", "<leader>cc", "<cmd>cclose<cr>")

-- Better identation
keymap("n", "<leader>ma", "==", { desc = "Auto identation" })
keymap("v", "<leader>ma", "==", { desc = "Auto identation" })

-- Better move around
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Go mode
keymap({ "n", "v" }, "gh", "^", { desc = "Move to line start", silent = true })
keymap({ "n", "v" }, "gl", "$", { desc = "Move to line end", silent = true })
keymap({ "n", "v" }, "ga", "<cmd>b#<cr>", { desc = "Switch to last buffer", silent = true })
keymap({ "n", "v" }, "L", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
keymap({ "n", "v" }, "H", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })

-- Wezterm navigator
keymap({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")

-- Tmux navigator
-- keymap({"n", "t"}, "<C-h>", "<cmd>lua require('tmux').move_left()<cr>")
-- keymap({"n", "t"}, "<C-j>", "<cmd>lua require('tmux').move_down()<cr>")
-- keymap({"n", "t"}, "<C-k>", "<cmd>lua require('tmux').move_up()<cr>")
-- keymap({"n", "t"}, "<C-l>", "<cmd>lua require('tmux').move_right()<cr>")

-- Better search and highlight
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "*zzzv", opts)
keymap("n", "#", "#zzzv", opts)
keymap("n", "<esc>", "<cmd>noh<cr>", opts)
keymap("n", "<leader>h", "<cmd>noh<cr>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)
keymap("n", "x", '"_x', opts)
keymap("n", "X", '"_X', opts)

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
