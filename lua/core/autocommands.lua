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
autocmd("VimLeavePre", {
  callback = function()
    -- Check if current directory is a git repository root
    local is_git_root = vim.fn.finddir('.git', '.') == '.git'

    -- Only save session if we're in a git root
    if is_git_root then
      vim.cmd('mksession!')
    end
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
