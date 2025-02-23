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
keymap("n", "<leader>q", function()
	if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
		vim.cmd("bd")
	else
		vim.cmd("q")
	end
end, { desc = "Close file or quit nvim" })
keymap("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit nvim" })

-- Layout
-- keymap("n", "tl", "<cmd>Telescope telescope-tabs list_tabs<cr>", { desc = "List layouts" })
keymap("n", "<A-t>", "<cmd>tabnew<cr>", { desc = "New layout" })
keymap("n", "<A-l>", "<cmd>tabnext<cr>", { desc = "Next layout" })
keymap("n", "<A-h>", "<cmd>tabprev<cr>", { desc = "Previous layout" })
keymap("n", "<A-w>", "<cmd>tabclose<cr>", { desc = "Close layout" })

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

-- Better move around
-- keymap("n", "<C-d>", "<C-d>zz")
-- keymap("n", "<C-u>", "<C-u>zz")
-- keymap("n", "<C-o>", "<C-o>zz")
-- keymap("n", "<C-i>", "<C-i>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Resize
-- keymap("n", "<down>", ":resize +2<cr>")
-- keymap("n", "<up>", ":resize -2<cr>")
-- keymap("n", "<right>", ":vertical resize +2<cr>")
-- keymap("n", "<left>", ":vertical resize -2<cr>")

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

-- LSP
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action" })

-- Toggle theme
keymap("n", "<leader>mt", function()
	local is_dark = vim.o.background == "dark"
	if is_dark then
		vim.cmd.colorscheme("catppuccin-latte")
		vim.o.background = "light"
	else
		vim.cmd.colorscheme("catppuccin-frappe")
		vim.o.background = "dark"
	end
end, { desc = "Toggle theme dark/light" })

-- Window Navigation
keymap({ "n", "v" }, "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap({ "n", "v" }, "<C-j>", "<C-w>j", { desc = "Move to down window" })
keymap({ "n", "v" }, "<C-k>", "<C-w>k", { desc = "Move to up window" })
keymap({ "n", "v" }, "<C-l>", "<C-w>l", { desc = "Move to right window" })
