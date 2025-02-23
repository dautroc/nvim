return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup()
	end,
	keys = {
		{
			"<leader>rr",
			function()
				require("grug-far").open()
			end,
			mode = "n",
			desc = "Open grug-far",
		},
		{
			"<leader>rr",
			function()
				require("grug-far").with_visual_selection()
			end,
			mode = "v",
			desc = "Open grug-far with visual selection",
		},
		{
			"<leader>rw",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			mode = "n",
			desc = "Open grug-far with word under cursor",
		},
	},
}
