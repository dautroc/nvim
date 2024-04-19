return {
	{
		"rebelot/kanagawa.nvim",
    lazy = false,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "wave", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "wave", -- try "dragon" !
					light = "lotus",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("tokyonight-storm")
		end,
	},

	-- Additional color schemes that can be loaded on demand
	-- Using lazy=true is okay; lazy.nvim automatically
	-- loads color scheme plugins when using `:colorscheme ...`
	-- but `Telescope colorscheme` and command completions
	-- might not work as expected.
	{ "catppuccin/nvim", name = "catppuccin", lazy = false },
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		config = function()
			vim.o.background = "dark"
		end,
	},
}
