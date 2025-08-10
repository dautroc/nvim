return {
	-- Tmux
	-- {
	-- 	"alexghergh/nvim-tmux-navigation",
	-- 	enabled = true,
	-- 	keys = {
	-- 		{ "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>" },
	-- 		{ "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>" },
	-- 		{ "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>" },
	-- 		{ "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>" },
	-- 	},
	-- 	config = function()
	-- 		local nvim_tmux_nav = require("nvim-tmux-navigation")
	--
	-- 		nvim_tmux_nav.setup({
	-- 			disable_when_zoomed = true,
	-- 		})
	-- 	end,
	-- },

	-- Wezterm
	-- {
	-- 	"letieu/wezterm-move.nvim",
	-- 	keys = {
	-- 		{
	-- 			"<C-h>",
	-- 			function()
	-- 				require("wezterm-move").move("h")
	-- 			end,
	-- 		},
	-- 		{
	-- 			"<C-j>",
	-- 			function()
	-- 				require("wezterm-move").move("j")
	-- 			end,
	-- 		},
	-- 		{
	-- 			"<C-k>",
	-- 			function()
	-- 				require("wezterm-move").move("k")
	-- 			end,
	-- 		},
	-- 		{
	-- 			"<C-l>",
	-- 			function()
	-- 				require("wezterm-move").move("l")
	-- 			end,
	-- 		},
	-- 		{
	-- 			"<C-;>",
	-- 			function()
	-- 				require("wezterm-move").move("j")
	-- 			end,
	-- 		},
	-- 	},
	-- },

	-- Zellij
	-- {
	-- 	"https://github.com/fresh2dev/zellij.vim.git",
	-- 	lazy = false,
	-- 	enabled = true,
	-- },
	{
		"MunsMan/kitty-navigator.nvim",
		keys = {
			{
				"<C-h>",
				function()
					require("kitty-navigator").navigateLeft()
				end,
				desc = "Move left a Split",
				mode = { "n" },
			},
			{
				"<C-j>",
				function()
					require("kitty-navigator").navigateDown()
				end,
				desc = "Move down a Split",
				mode = { "n" },
			},
			{
				"<C-k>",
				function()
					require("kitty-navigator").navigateUp()
				end,
				desc = "Move up a Split",
				mode = { "n" },
			},
			{
				"<C-l>",
				function()
					require("kitty-navigator").navigateRight()
				end,
				desc = "Move right a Split",
				mode = { "n" },
			},
		},
	},
	-- {
	--   "https://git.sr.ht/~swaits/zellij-nav.nvim",
	--   lazy = true,
	--   event = "VeryLazy",
	--   keys = {
	--     { "<c-h>", "<cmd>ZellijNavigateLeft<cr>", { silent = true, desc = "navigate left" } },
	--     { "<c-j>", "<cmd>ZellijNavigateDown<cr>", { silent = true, desc = "navigate down" } },
	--     { "<c-k>", "<cmd>ZellijNavigateUp<cr>", { silent = true, desc = "navigate up" } },
	--     { "<c-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right" } },
	--   },
	--   opts = {},
	-- },
}
