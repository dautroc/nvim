return {
	{
		"vimpostor/vim-lumen",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[
				au User LumenLight echom 'github_light'
				au User LumenDark echom 'github_dark'
			]])
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- priority = 1000,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
    priority = 1000,
	},
}
