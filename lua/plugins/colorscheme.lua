return {
	{
		"vimpostor/vim-lumen",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[
				au User LumenLight echom 'catppuccin-latte'
				au User LumenDark echom 'catppuccin-frappe'
			]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
	  "ellisonleao/gruvbox.nvim",
	  config = true
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
}
