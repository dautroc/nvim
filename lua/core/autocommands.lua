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
