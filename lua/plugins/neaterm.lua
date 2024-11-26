return {
	"Dan7h3x/neaterm.nvim",
  enabled = false,
	branch = "stable",
	event = "VeryLazy",
	opts = {
		-- Terminal settings
		shell = vim.o.shell,
		float_width = 0.5,
		float_height = 0.4,
		move_amount = 3,
		resize_amount = 2,
		border = "rounded",

		-- Appearance
		highlights = {
			normal = "Normal",
			border = "FloatBorder",
			title = "Title",
		},

		-- Window management
		min_width = 20,
		min_height = 3,

		-- Default keymaps
		keymaps = {
			toggle = "<A-t>",
			new_vertical = "<A-v>",
			new_horizontal = "<A-x>",
			new_float = "<A-f>",
			close = "<A-d>",
			next = "<A-o>",
			prev = "<A-i>",
			move_up = "<C-A-Up>",
			move_down = "<C-A-Down>",
			move_left = "<C-A-Left>",
			move_right = "<C-A-Right>",
			resize_up = "<C-S-Up>",
			resize_down = "<C-S-Down>",
			resize_left = "<C-S-Left>",
			resize_right = "<C-S-Right>",
			focus_bar = "<C-A-b>",
			repl_toggle = "<leader>rt",
			repl_send_line = "<leader>rl",
			repl_send_selection = "<leader>rs",
			repl_send_buffer = "<leader>rb",
			repl_clear = "<leader>rc",
			repl_history = "<leader>rh",
			repl_variables = "<leader>rv",
			repl_restart = "<leader>rR",
		},

		-- REPL configurations
		repl = {
			float_width = 0.6,
			float_height = 0.4,
			save_history = true,
			history_file = vim.fn.stdpath("data") .. "/neaterm_repl_history.json",
			max_history = 100,
			update_interval = 5000,
		},

		-- REPL language configurations
		repl_configs = {
			python = {
				name = "Python (IPython)",
				cmd = "ipython --no-autoindent --colors='Linux'",
				startup_cmds = {
					"import sys",
					"sys.ps1 = 'In []: '",
					"sys.ps2 = '   ....: '",
				},
				get_variables_cmd = "whos",
				inspect_variable_cmd = "?",
				exit_cmd = "exit()",
			},
			r = {
				name = "R (Radian)",
				cmd = "radian",
				startup_cmds = {
					"options(width = 80)",
					"options(prompt = 'R> ')",
				},
				get_variables_cmd = "ls.str()",
				inspect_variable_cmd = "str(",
				exit_cmd = "q(save='no')",
			},
			lua = {
				name = "Lua",
				cmd = "lua",
				exit_cmd = "os.exit()",
			},
			node = {
				name = "Node.js",
				cmd = "node",
				get_variables_cmd = "Object.keys(global)",
				exit_cmd = ".exit",
			},
			sh = {
				name = "Shell",
				cmd = vim.o.shell,
				startup_cmds = {
					"PS1='$ '",
					"TERM=xterm-256color",
				},
				get_variables_cmd = "set",
				inspect_variable_cmd = "echo $",
				exit_cmd = "exit",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
	},
}
