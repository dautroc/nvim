local nvim_lsp = require('lspconfig')
require'lspconfig'.solargraph.setup{}

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	local opts = { noremap=true, silent=true }

	buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', 'gj', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gx', ':sp<CR><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gv', ':vsp<CR><Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gr', ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)
	buf_set_keymap('n', 'gi', ":lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
	buf_set_keymap('n', 'ga', ":lua require'telescope.builtin'.lsp_code_actions{}<CR>", opts)
end

local servers = {"solargraph"}
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup { on_attach = on_attach }
end
