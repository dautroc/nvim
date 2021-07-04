vim.cmd 'packadd paq-nvim'
local paq = require('paq-nvim').paq
paq {'savq/paq-nvim', opt = true}
paq {'nvim-treesitter/nvim-treesitter'}
paq {'neovim/nvim-lspconfig'}
-- paq {'junegunn/fzf', run = fn['fzf#install']}
-- paq {'junegunn/fzf.vim'}
-- paq {'yegappan/mru'}
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
