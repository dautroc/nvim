-- Vim configuration
require('plugins')
require('settings')
require('key_bindings')

-- Plugin configuration
require('esearch_config')
require('fzf_config')
require('nvimtree_config')
require('treesitter_config')
require('signify_config')
require('vimtest_config')
require('starify_config')
require('eviline')
require('luatab_config')
require('hop_config')
require('telescope_config')
require('lspconfig_config')
require('nvim-lsp-installer').setup {}
require('marks_config')
require('gitlinker_config')
require('coq_config')
require("nvim-autopairs").setup {}

vim.diagnostic.disable()
