return {
	{
		"alexghergh/nvim-tmux-navigation",
		enabled = false,
		keys = {
			{ "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>" },
			{ "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>" },
			{ "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>" },
			{ "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>" },
		},
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true,
			})
		end,
	},
	{
		"letieu/wezterm-move.nvim",
		enabled = true,
		keys = {
			{
				"<C-h>",
				function()
					require("wezterm-move").move("h")
				end,
			},
			{
				"<C-j>",
				function()
					require("wezterm-move").move("j")
				end,
			},
			{
				"<C-k>",
				function()
					require("wezterm-move").move("k")
				end,
			},
			{
				"<C-l>",
				function()
					require("wezterm-move").move("l")
				end,
			},
			{
				"<C-;>",
				function()
					require("wezterm-move").move("j")
				end,
			},
		},
	},
	{
		"https://git.sr.ht/~swaits/zellij-nav.nvim",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
		keys = {
			{ "<M-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
			{ "<M-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
			{ "<M-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
			{ "<M-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
		},
		opts = {},
	},
}
