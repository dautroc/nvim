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
	{
		"letieu/wezterm-move.nvim",
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

  -- Zellij
  -- {
  --   'https://github.com/fresh2dev/zellij.vim.git',
  --   lazy = false,
  -- }
}
