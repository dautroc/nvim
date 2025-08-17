return {
	"vieitesss/miniharp.nvim",
	config = true,
	keys = {
		{
			"<leader>hh",
			function()
				require("miniharp").toggle_file()
			end,
			desc = "Toggle file mark",
		},
		{
			"<leader>hn",
			function()
				require("miniharp").next()
			end,
			desc = "Next file mark",
		},
		{
			"<leader>hp",
			function()
				require("miniharp").prev()
			end,
			desc = "Previous file mark",
		},
    {
      "<leader>hl",
      function()
        require("miniharp").list()
      end,
      desc = "List file marks",
    },
    {
      "<leader>hc",
      function()
        require("miniharp").clear()
      end,
      desc = "Remove all file marks",
    },
	},
}
