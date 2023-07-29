vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Briefly highlight yanked text",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Automatically close tab/vim when nvim-tree is the last window in the tab
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Markdown identation
vim.cmd("autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2")

-- Terminal keymap
function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", ";", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<CMD>NavigatorLeft<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<CMD>NavigatorDown<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<CMD>NavigatorUp<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<CMD>NavigatorRight<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")


