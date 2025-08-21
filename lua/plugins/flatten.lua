return {
	"willothy/flatten.nvim",
	config = true,
	lazy = false,
	priority = 1001,
	opts = {
		block_for = {
			gitcommit = true,
			gitrebase = true,
		},
		disable_cmd_passthrough = false,
		nest_if_no_args = false,
		nest_if_cmds = false,
		window = {
			open = "current",
			diff = "tab_vsplit",
			focus = "first",
		},
		integrations = {
			kitty = true,
			wezterm = true,
		},
	},
}
