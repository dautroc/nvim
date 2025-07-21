return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	opts = {
		border = false,
		size = { h = 100, w = 100 },

		-- to use, make this func(buf)
		mappings = { sidebar = nil, term = nil },

		-- Default sets of terminals you'd like to open
		terminals = {
			{ name = "Terminal" },
			-- cmd can be function too
			{ name = "Terminal", cmd = "neofetch" },
			-- More terminals
		},
	},
	cmd = "FloatermToggle",
	keys = {
		{
			"<A-f>",
			"<cmd>FloatermToggle<cr>",
			mode = { "n", "t" },
			desc = "Toggle Floaterm",
		},
		{
			"<A-r>",
			"<C-h>e",
			mode = { "n", "t" },
			desc = "Next Floaterm",
		},
	},
}
