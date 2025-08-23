require("core.settings")
require("core.options")
require("core.keymaps")
require("lazy-setup")
require("core.autocommands")

-- LSP
vim.lsp.config['lua_ls'] = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
}
vim.lsp.config['ruby_lsp'] = {
  cmd = { 'ruby-lsp' },
  filetypes = { 'ruby' },
}
vim.lsp.config['ts_ls'] = {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript', 'javascriptreact', 'javascript.jsx' },
}
vim.lsp.config['pyright'] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
}
vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
}

vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')
