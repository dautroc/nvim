local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-------------------- PLUGINS -------------------------------
cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
-- paq {'junegunn/fzf', run = fn['fzf#install']}
-- paq {'junegunn/fzf.vim'}
paq {'ojroques/nvim-lspfuzzy'}
paq {'kyazdani42/nvim-web-devicons'}
paq {'kyazdani42/nvim-tree.lua'}
paq {'mhinz/vim-startify'}
paq {'preservim/vimux'}
paq {'vim-test/vim-test'}
paq {'sindrets/diffview.nvim'}
paq {'nvim-lua/popup.nvim'}
paq {'nvim-lua/plenary.nvim'}
paq {'nvim-telescope/telescope.nvim'}
paq {'glepnir/galaxyline.nvim' , branch = 'main'}
paq {'tpope/vim-fugitive'}
paq {'vim-scripts/git-time-lapse'}
paq {'tyrannicaltoucan/vim-deep-space'}
paq {'mhinz/vim-signify'}
-- paq {'yegappan/mru'}
paq {'hrsh7th/nvim-compe'}
paq {'dense-analysis/ale'}
paq {'tomtom/tcomment_vim'}
paq {'easymotion/vim-easymotion'}
paq {'terryma/vim-multiple-cursors'}
paq {'ntpeters/vim-better-whitespace'}
paq {'flazz/vim-colorschemes'}
paq {'windwp/nvim-autopairs'}
paq {'Yggdroot/indentLine'}
paq {'tpope/vim-surround'}
paq {'tpope/vim-endwise'}
paq {'alvan/vim-closetag'}

-------------------- VARIABLES -------------------------------
g.mapleader = ','
-------------------- OPTIONS -------------------------------
cmd 'colorscheme deep-space'
opt.number = true
opt.linespace = 1
opt.smartcase = true
opt.updatetime = 100
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.lazyredraw = true
opt.encoding = 'utf-8'
opt.signcolumn = 'yes'
opt.termguicolors = true
opt.relativenumber = true
opt.clipboard = 'unnamedplus'
opt.completeopt = {'menuone', 'noselect'}

-------------------- INDENT LINE -------------------------------
g.indentLine_enabled = 0
-------------------- NVIM TREE -------------------------------
map('n', '<leader>v', '<CMD>:NvimTreeToggle<CR>')
map('n', '<leader>r', '<CMD>:NvimTreeRefresh<CR>')
map('n', '<leader>n', '<CMD>:NvimTreeFindFile<CR>')

g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_follow = 1
g.nvim_tree_gitignore = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE' }
g.nvim_tree_window_picker_exclude = {
  filetype = { 'packer', 'qf' },
  buftype = { 'terminal' }
}
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
require('nvimtree_config')
-------------------- MAPPINGS ------------------------------
-- Turn off highlight
map('n', '<C-c>', '<CMD>:noh<CR>', { nowait = true })

-- Switch window
g.tmux_navigator_no_mappings = 1
map('', '<space>h', '<C-W>h', { silent = true })
map('', '<space>j', '<C-W>j', { silent = true })
map('', '<space>k', '<C-W>k', { silent = true })
map('', '<space>l', '<C-W>l', { silent = true })

-- Tab control
map('n', 'tn', ':tabnew<CR>',   { silent = true })
map('n', 'th', ':tabfirst<CR>', { silent = true })
map('n', 'tl', ':tablast<CR>',  { silent = true })
map('n', 'tj', ':tabprev<CR>',  { silent = true })
map('n', 'tk', ':tabnext<CR>',  { silent = true })
map('n', 'tt', ':tabclose<CR>', { silent = true })

-- Quick escape
map('i', 'jj', '<ESC>')

-- Get file path
map('', '<leader>pp', ':let @+=@%<CR>', { silent = true })

-------------------- TREE-SITTER ---------------------------
require('treesister_config')

-------------------- LSP -----------------------------------
require('lspconfig_config')
-------------------- EASY MOTION -----------------------------------

g.EasyMotion_do_mapping = 0
g.EasyMotion_smartcase = 1

--map('', '/', '<Plug>(easymotion-sn)')
--map('o', '/', '<Plug>(easymotion-tn)')
--map('n', '<tab>', "<Plug>(easymotion-bd-w)", { silent = true })
-------------------- DIFF VIEW ------------------------------
map('n', '<leader>dv', '<CMD>:DiffviewOpen<CR>')
require('diffview_config')

-------------------- TELESCOPE ------------------------------
map('n', '<C-p>', ':Telescope find_files<cr>')
map('n', '<C-g>', ':Telescope live_grep<cr>')
map('n', '<C-h>', ':Telescope help_tags<cr>')
map('n', '<C-r>', ':Telescope oldfiles<cr>')

require('telescope_config')
-------------------- ALE ------------------------------
g.ale_linter_aliases = {rspec = {'ruby'}}
g.ale_linters = {
 ruby =  {'rubocop'},
 rspec = {'rubocop'},
}

local _ale_fixer = {}
_ale_fixer['*'] = {'remove_trailing_lines', 'trim_whitespace'};
_ale_fixer['ruby'] = {'remove_trailing_lines', 'trim_whitespace', 'rubocop'};
_ale_fixer['rspec'] = {'remove_trailing_lines', 'trim_whitespace'};

g.ale_fixer = _ale_fixer
g.ale_disable_lsp = 1
g.ale_fix_on_save = 0
-------------------- SIGNIFY ------------------------------
g.signify_vcs_list = {'git'}
g.signify_sign_show_count = 0
g.signify_sign_add               = '+'
g.signify_sign_delete            = '-'
g.signify_sign_delete_first_line = '-'
g.signify_sign_change            = '·'
g.signify_sign_changedelete      = g.signify_sign_change
-------------------- VIM TEST ------------------------------
map('n', '<leader>tn', ':TestNearest<CR>')
map('n', '<leader>tf', ':TestFile<CR>')
map('n', '<leader>ts', ':TestSuite<CR>')

g.VimuxUseNearest = 0
-- g.test.strategy = 'vimux'
-- g.test.ruby.rspec.executable = 'bundle exec rspec'

-------------------- STARIFY ------------------------------
g.startify_change_to_dir = 0
g.startify_session_dir = '~/.vim/session'
g.startify_session_persistence = 1
g.startify_session_number = 3
g.startify_session_sort = 1

-------------------- OTHER PLUGINS ------------------------------
require('compe_config')
	require('eviline')
require('autopairs_config')
-------------------- COMMANDS ------------------------------
cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
cmd 'au FileType jsonnet set tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'au FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'au FileType lua set tabstop=2 shiftwidth=2 softtabstop=2'
cmd 'au BufEnter * autocmd! matchparen'
