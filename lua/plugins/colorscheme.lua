return {
	{
		"vimpostor/vim-lumen",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[
				au User LumenLight echom 'gruvbox'
				au User LumenDark echom 'gruvbox'
			]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
	},
	{
	  "ellisonleao/gruvbox.nvim",
	  config = true,
		priority = 1000,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
	},
}
