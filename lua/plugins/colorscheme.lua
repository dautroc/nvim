return {
	{
		"vimpostor/vim-lumen",
		enabled = false,
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
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-frappe")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'soft'
		end,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			-- vim.cmd.colorscheme("everforest")
		end,
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
