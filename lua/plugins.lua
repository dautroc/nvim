vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
use 'wbthomason/packer.nvim'

use {'eugen0329/vim-esearch'}
use {'nvim-treesitter/nvim-treesitter'}
use {'neovim/nvim-lspconfig'}
use {'junegunn/fzf.vim',
  requires = {{'junegunn/fzf', run = vim.fn['fzf#install']}}
}
use {'yegappan/mru'}
use {'ojroques/nvim-lspfuzzy'}
use {'kyazdani42/nvim-tree.lua',
  requires = {{'kyazdani42/nvim-web-devicons'}}
}
use {'mhinz/vim-startify'}
use {'preservim/vimux'}
use {'vim-test/vim-test'}
use {'sindrets/diffview.nvim'}
use {
  'nvim-telescope/telescope.nvim',
  requires = {
		{'nvim-lua/popup.nvim'},
		{'nvim-lua/plenary.nvim'}
	}
}
use {'glepnir/galaxyline.nvim' , branch = 'main'}
use {'tpope/vim-fugitive'}
use {'vim-scripts/git-time-lapse'}
use {'tyrannicaltoucan/vim-deep-space'}
use {'mhinz/vim-signify'}
use {'hrsh7th/nvim-compe'}
use {'dense-analysis/ale'}
use {'tomtom/tcomment_vim'}
use {'easymotion/vim-easymotion'}
use {'flazz/vim-colorschemes'}
use {'windwp/nvim-autopairs'}
use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }
use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
end)
