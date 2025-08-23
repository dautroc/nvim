-- Enable each server
vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('fuzzy_ls')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')

-- Custom on_attach function for keymaps
local function lsp_attach(client, bufnr)
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  -- Go to definition
  map('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
  -- Go to declaration
  map('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
  -- Go to implementation
  map('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
  -- Go to references
  map('n', 'gr', vim.lsp.buf.references, 'List references')
  -- Hover documentation
  map('n', 'K', vim.lsp.buf.hover, 'Show documentation')
  -- Signature help
  map('n', '<C-s>', vim.lsp.buf.signature_help, 'Show signature help')
  -- Rename symbol
  map('n', '<leader>lr', vim.lsp.buf.rename, 'Rename symbol')
  -- Code actions
  map('n', '<leader>la', vim.lsp.buf.code_action, 'Code action')
  map('v', '<leader>la', vim.lsp.buf.code_action, 'Code action (visual)')
  -- Format buffer
  map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, 'Format buffer')
  -- Diagnostics: next/prev
  map('n', '[d', vim.diagnostic.goto_prev, 'Previous diagnostic')
  map('n', ']d', vim.diagnostic.goto_next, 'Next diagnostic')
  -- Show diagnostics in a floating window
  map('n', '<leader>ld', vim.diagnostic.open_float, 'Show diagnostics')
  -- Set location list with diagnostics
  map('n', '<leader>lq', vim.diagnostic.setloclist, 'Diagnostics to location list')
end

-- Set default capabilities
local capabilities = require('blink.cmp').get_lsp_capabilities()

-- Optionally, set defaults for all servers
vim.lsp.defaults.capabilities = capabilities
vim.lsp.defaults.on_attach = lsp_attach
