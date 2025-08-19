return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	enabled = true,
	opts = {
		border = false,
		size = { h = 60, w = 70 },

		mappings = { sidebar = nil, term = nil },

		terminals = {
			{ name = "Terminal" },
		},
	},
	cmd = "FloatermToggle",
	keys = {
		{
			"<C-f>",
			"<cmd>FloatermToggle<cr>",
			mode = { "n", "t" },
			desc = "Toggle Floaterm",
		},
	},
}
