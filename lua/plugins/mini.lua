return {
	"echasnovski/mini.nvim",
	keys = {
		{ "gS", "<CMD>lua MiniSplitjoin.toggle()<CR>", desc = "Mini split join" },
	},
	event = "BufRead",
	version = false,
	lazy = false,
	config = function()
		require("mini.diff").setup()
		require("mini.splitjoin").setup()
		require("mini.icons").setup()
		require("mini.sessions").setup()
	end,
}
