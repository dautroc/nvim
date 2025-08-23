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

-- -- LSP Keymaps
-- local on_lsp_attach = function(client, bufnr)
--   -- Guard against nil client
--   if not client then
--     vim.notify("LSP client is nil in on_attach callback", vim.log.levels.WARN)
--     return
--   end
--
--   local opts = {buffer = bufnr}
--
--   -- Navigation keymaps
--   map('n', 'gd', vim.lsp.buf.definition, opts) -- Go to definition
--   map('n', 'gD', vim.lsp.buf.declaration, opts) -- Go to declaration
--   map('n', 'gr', vim.lsp.buf.references, opts) -- Find references
--   map('n', 'gi', vim.lsp.buf.implementation, opts) -- Go to implementation
--   map('n', 'gt', vim.lsp.buf.type_definition, opts) -- Go to type definition
--
--   -- Documentation
--   map('n', 'K', vim.lsp.buf.hover, opts) -- Show hover documentation
--   map('n', '<leader>lh', vim.lsp.buf.signature_help, opts) -- Signature help
--
--   -- Code actions
--   map('n', '<leader>la', vim.lsp.buf.code_action, opts) -- Code actions
--   map('n', '<leader>lr', vim.lsp.buf.rename, opts) -- Rename symbol
--
--   -- Formatting (only if server supports it)
--   if client.server_capabilities and client.server_capabilities.documentFormattingProvider then
--     map('n', '<leader>lf', vim.lsp.buf.format, opts) -- Format document
--   end
--
--   -- Diagnostics
--   map('n', '<leader>ld', vim.diagnostic.open_float, opts) -- Show diagnostic popup
--   map('n', '[d', vim.diagnostic.goto_prev, opts) -- Previous diagnostic
--   map('n', ']d', vim.diagnostic.goto_next, opts) -- Next diagnostic
--   map('n', '<leader>lq', vim.diagnostic.setloclist, opts) -- Populate location list with diagnostics
--
--   -- Workspace symbols (better than document symbols for most cases)
--   map('n', '<leader>ls', vim.lsp.buf.workspace_symbol, opts) -- Search workspace symbols
--
--   -- Document symbols (alternative mapping)
--   map('n', '<leader>lo', vim.lsp.buf.document_symbol, opts) -- Document outline/symbols
--
--   -- Inlay hints toggle (if supported)
--   if client.server_capabilities and client.server_capabilities.inlayHintProvider then
--     map('n', '<leader>lI', function()
--       vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
--     end, opts)
--   end
-- end
