return {
	{
		"vimpostor/vim-lumen",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[
				au User LumenLight echom 'rose-pine-dawn'
				au User LumenDark echom 'rose-pine-moon'
			]])
		end,
	},
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	-- priority = 1000,
	-- },
	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	name = "github-theme",
	-- 	priority = 1000,
	-- },
	{
	  "rose-pine/neovim",
	  name = "rose-pine",
    priority = 1000,
	},
}
