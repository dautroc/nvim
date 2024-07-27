return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>e",
			function()
				require("yazi").yazi()
			end,
			desc = "Open the file manager",
		},
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,

		-- enable these if you are using the latest version of yazi
		-- use_ya_for_events_reading = true,
		-- use_yazi_client_id_flag = true,
	},
}
