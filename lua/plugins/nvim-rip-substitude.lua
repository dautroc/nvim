return {
	"chrisgrieser/nvim-rip-substitute",
	keys = {
		{
			"<leader>fR",
			function()
				require("rip-substitute").sub()
			end,
			mode = { "n", "x" },
			desc = "Rip substitute",
		},
	},
}
