local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})

autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Auto resize splits when the terminal's window is resized
autocmd("VimResized", {
	command = "wincmd =",
})

-- Balance splits when opening a terminal
autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("wincmd =")
  end,
})

-- IWE note taking
autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		vim.lsp.start({
			name = "iwes",
			cmd = { "iwes" },
			root_dir = vim.fs.root(args.buf, { ".iwe" }),
			flags = {
				debounce_text_changes = 500,
			},
		})
	end,
})

-- Call command mksession! after quitting nvim, but only in git repositories
-- autocmd("VimLeavePre", {
-- 	callback = function()
-- 		-- Check if current directory is a git repository root
-- 		local is_git_root = vim.fn.finddir(".git", ".") == ".git"
--
-- 		-- Only save session if we're in a git root
-- 		if is_git_root then
-- 			vim.cmd("mksession!")
-- 		end
-- 	end,
-- })

-- Ghostty LSP
function setup_ghostty_lsp()
	-- Only activate ghostty-lsp when editing the ghostty config
	if vim.fn.expand("%:p") == vim.fs.normalize("~/.config/ghostty/config") then
		vim.lsp.start({
			name = "ghostty-lsp",
			cmd = { "ghostty-lsp" },
			root_dir = vim.fs.normalize("~/.config/ghostty"),
		})
	end
end

autocmd("BufRead", { pattern = "*", callback = setup_ghostty_lsp })

-- Neotest output closing
local group = vim.api.nvim_create_augroup("NeotestConfig", {})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "neotest-output",
	group = group,
	callback = function(opts)
		vim.keymap.set("n", "q", function()
			pcall(vim.api.nvim_win_close, 0, true)
		end, {
			buffer = opts.buf,
		})
	end,
})

-- Set terminal keymaps
function _G.set_terminal_keymaps()
	-- Only set keymaps if we're in a toggleterm buffer
	if vim.bo.filetype ~= "toggleterm" then
		return
	end

	local opts = { buffer = 0 }
	-- vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], opts)
	-- vim.keymap.set("t", "<c-;>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)

	-- Navigation
	-- vim.keymap.set("t", "<C-h>", [[<CMD>ZellijNavigateLeftTab<CR>]], opts)
	-- vim.keymap.set("t", "<C-j>", [[<CMD>ZellijNavigateDown<CR>]], opts)
	-- vim.keymap.set("t", "<C-k>", [[<CMD>ZellijNavigateUp<CR>]], opts)
	-- vim.keymap.set("t", "<C-l>", [[<CMD>ZellijNavigateRightTab<CR>]], opts)

	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

	-- Toggle term
	vim.keymap.set("t", "<A-v>", [[<CMD>ToggleTerm direction=vertical name=vertical<CR>]], opts)
	vim.keymap.set("t", "<A-x>", [[<CMD>ToggleTerm direction=horizontal name=horizontal<CR>]], opts)
	vim.keymap.set("t", "<A-f>", [[<CMD>ToggleTerm direction=float name=float<CR>]], opts)
	vim.keymap.set("t", "<C-t>", [[<CMD>ToggleTerm<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
