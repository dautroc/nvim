vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'

use {'neovim/nvim-lspconfig'}
use {'eugen0329/vim-esearch'}
use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
use {'junegunn/fzf.vim',
  requires = {{'junegunn/fzf', run = vim.fn['fzf#install']}}
}
use {'kyazdani42/nvim-tree.lua',
  requires = {{'kyazdani42/nvim-web-devicons'}}
}
use {'mhinz/vim-startify'}
use {'vim-test/vim-test'}
use {'glepnir/galaxyline.nvim' , branch = 'main'}
use {'tyrannicaltoucan/vim-deep-space'}
use {'mhinz/vim-signify'}
use {'tomtom/tcomment_vim'}
use {'flazz/vim-colorschemes'}
-- use {'windwp/nvim-autopairs'}
use {'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons'}
use {'phaazon/hop.nvim'}
use {'tpope/vim-rails'}
-- use {'tpope/vim-projectionist'}
use {'tpope/vim-surround'}
use {'ntpeters/vim-better-whitespace'}
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}
use {'ms-jpq/coq_nvim', branch = 'coq'}
use {'ms-jpq/coq.artifacts', branch = 'artifacts'}
use {'davidgranstrom/nvim-markdown-preview'}
use {"williamboman/nvim-lsp-installer"}
use {'kdheepak/lazygit.nvim'}
use {'famiu/nvim-reload'}
use {'windwp/nvim-ts-autotag'}
use {'chentoast/marks.nvim'}
use {'f-person/git-blame.nvim'}
use {
	'ruifm/gitlinker.nvim',
	requires = 'nvim-lua/plenary.nvim',
}
use {'tpope/vim-dispatch'}
use {'mbbill/undotree'}
use {'markstory/vim-zoomwin'}
use {
	'narutoxy/silicon.lua',
	requires = { 'nvim-lua/plenary.nvim' }
}
use {'cohama/lexima.vim'}
use {
	'LukasPietzschmann/telescope-tabs',
	requires = { 'nvim-telescope/telescope.nvim' },
	config = function()
		require'telescope-tabs'.setup{
			-- Your custom config :^)
		}
	end
}
end)
