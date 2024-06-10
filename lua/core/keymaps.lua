-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Map leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Magic mode search
-- Dynamically add "\v" to enable very magic mode for all the useful commands;
-- "substitute", "global" and "vimgrep".
-- keymap("n", "/", [[/\v]], { noremap = true })
-- keymap("n", "?", [[?\v]], { noremap = true })

-- Quick actions
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>x", "<C-w>s", { desc = "Split" })
keymap("n", "<leader>v", "<C-w>v", { desc = "Vsplit" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit file" })
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all files" })

-- Layout
keymap("n", "tl", "<cmd>Telescope telescope-tabs list_tabs<cr>", { desc = "List layouts" })
keymap("n", "ta", "<cmd>tabnew<cr>", { desc = "Add layout" })
keymap("n", "tk", "<cmd>tabnext<cr>", { desc = "Next layout" })
keymap("n", "tj", "<cmd>tabprev<cr>", { desc = "Previous layout" })
keymap("n", "tt", "<cmd>tabclose<cr>", { desc = "Close layout" })

-- Custom functions
keymap("n", "<leader>ms", "<cmd>lua require('core.functions').say_word()<cr>", { desc = "Say word" })
keymap("n", "<leader>mc", "z=", { desc = "Spell check" })
keymap("n", "dd", ":lua require('core.functions').smart_delete()<CR>", { noremap = true, silent = true })

-- Buffers
keymap("n", "<leader>by", '<cmd>let @+ = expand("%")<cr>', { desc = "Copy buffer path" })
keymap(
	"n",
	"<leader>bY",
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

-- Better search and highlight
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "*", "*zzzv", opts)
keymap("n", "#", "#zzzv", opts)
keymap("n", "<esc>", "<cmd>noh<cr>", opts)
-- keymap("n", "<leader>h", "<cmd>noh<cr>", opts)

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

-- Utils
keymap("n", "<leader>mus", "<cmd>%!sort<cr>", opts)
keymap("n", "<leader>muu", "<cmd>%!uniq<cr>", opts)
keymap("n", "<leader>mut", "<cmd>pu=strftime('%b %d, %Y')<cr>", { desc = "Insert date", silent = true })

-- LSP
keymap("n", "<leader>lm", "<cmd>Mason<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>ll", "<cmd>LspLog<cr>", opts)
