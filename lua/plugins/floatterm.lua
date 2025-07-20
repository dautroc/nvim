return {
	"nvzone/floaterm",
	dependencies = "nvzone/volt",
	opts = {},
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
    }
	},
}
