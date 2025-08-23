-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Map leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Quick actions
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
keymap("n", "<leader>s", "<C-w>s", { desc = "Split" })
keymap("n", "<leader>v", "<C-w>v", { desc = "Vsplit" })
keymap("n", "q", "<cmd>q<cr>", { desc = "Close buffer" })
keymap("n", "Q", "<cmd>only<cr>", { desc = "Close other buffers" })
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit nvim" })
keymap("n", "<C-Esc>", "<cmd>qa<cr>", { desc = "Quit nvim" })

-- Terminal
keymap("t", "<c-;>", [[<C-\><C-n>]])
keymap("t", "<a-x>", [[<C-\><C-n>]<C-d>])
keymap("t", "<c-h>", [[<C-\><C-n><C-w>h]])
keymap("t", "<c-j>", [[<C-\><C-n><C-w>j]])
keymap("t", "<c-k>", [[<C-\><C-n><C-w>k]])
keymap("t", "<c-l>", [[<C-\><C-n><C-w>l]])

-- Layout
keymap({ "n", "t" }, "<A-t>", "<cmd>tabnew<cr>", { desc = "New layout" })
keymap({ "n", "t" }, "<A-n>", "<cmd>tabnext<cr>", { desc = "Next layout" })
keymap({ "n", "t" }, "<A-p>", "<cmd>tabprev<cr>", { desc = "Previous layout" })
keymap({ "n", "t" }, "<A-w>", "<cmd>tabclose<cr>", { desc = "Close layout" })

-- Custom functions
keymap("n", "dd", ":lua require('core.functions').smart_delete()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>mv", "ggVG", { desc = "Select all in current buffer", silent = true })

-- Buffers
keymap("n", "<leader>by", '<cmd>let @+ = fnamemodify(expand("%"), ":.")<cr>', { desc = "Copy relative path" })
keymap(
	"n",
	"<leader>bY",
	[[<cmd>let @+ = join([expand('%'),  line(".")], ':')<cr>]],
	{ desc = "Copy path with line number" }
)
keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })

-- Quickfix list
keymap("n", "<leader>cn", "<cmd>cnext<cr>")
keymap("n", "<leader>cp", "<cmd>cprev<cr>")
keymap("n", "<leader>co", "<cmd>copen<cr>")
keymap("n", "<leader>cc", "<cmd>cclose<cr>")

-- Better identation
keymap("n", "<leader>ma", "==", { desc = "Auto identation" })
keymap("v", "<leader>ma", "==", { desc = "Auto identation" })

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Go mode
keymap({ "n", "v" }, "gh", "^", { desc = "Move to line start", silent = true })
keymap({ "n", "v" }, "gl", "$", { desc = "Move to line end", silent = true })
keymap({ "n", "v" }, "ga", "<cmd>b#<cr>", { desc = "Switch to last buffer", silent = true })
keymap({ "n", "v" }, "H", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
keymap({ "n", "v" }, "L", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })
keymap({ "n", "v" }, "<a-h>", "<cmd>bprev<cr>", { desc = "Previous buffer", silent = true })
keymap({ "n", "v" }, "<a-l>", "<cmd>bnext<cr>", { desc = "Next buffer", silent = true })

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

-- Toggle theme
keymap("n", "<leader>mt", function()
	local is_dark = vim.o.background == "dark"
	if is_dark then
		-- vim.cmd.colorscheme("gruvbox-material")
		vim.cmd.colorscheme("gruvbox-material")
		vim.o.background = "light"
	else
		-- vim.cmd.colorscheme("gruvbox-material")
		vim.cmd.colorscheme("gruvbox-material")
		vim.o.background = "dark"
	end
end, { desc = "Toggle theme dark/light" })
