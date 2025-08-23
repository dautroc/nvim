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

-- LSP Keymaps
local on_lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  -- Example keymaps:
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- Go to declaration
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts) -- Find references
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts) -- Go to implementation
  vim.keymap.set('n', 'go', vim.lsp.buf.document_symbol, opts) -- Go to symbol in document
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Show hover documentation
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, opts) -- Rename symbol
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, opts) -- Signature help
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, opts) -- Code actions
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, opts) -- Format document
  vim.keymap.set('n', '<leader>lq', vim.diagnostic.set_loclist, opts) -- Populate quickfix list with diagnostics
  -- Add more keymaps as needed
end

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
  callback = on_lsp_attach,
})
