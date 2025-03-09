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
		priority = 1000,
		config = true,
	},
}
