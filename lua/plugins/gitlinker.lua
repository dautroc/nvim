return {
	"ruifm/gitlinker.nvim",
	lazy = true,
	keys = {
		{
			"<leader>gl",
			'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			desc = "Get link to current buffer",
			mode = "n",
		},
		{
			"<leader>gl",
			'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
			desc = "Open in browsers",
			mode = "v",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
