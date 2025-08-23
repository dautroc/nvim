return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true },
		scroll = { enabled = true },
		image = { enabled = true },
		dashboard = {
			enabled = false,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
		},
		notifier = {
			enabled = true,
			timeout = 3000,
		},
		quickfile = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		styles = {
			notification = {
				wo = { wrap = true }, -- Wrap notifications
			},
		},
		zen = {
			win = {
				width = 0.6,
			},
			toggles = {
				dim = false,
				git_signs = true,
				mini_diff_signs = false,
				-- diagnostics = false,
				-- inlay_hints = false,
			},
			show = {
				statusline = true, -- can only be shown when using the global statusline
				tabline = false,
			},
		},
		picker = {
			sources = {
				explorer = {},
				aerial = require("plugins.aerial.picker"),
				directory = require("plugins.snacks.dir-picker"),
			},
			layout = {
				preset = "ivy",
				cycle = false,
			},
			formatters = {
				file = {
					filename_first = true,
					truncate = 100,
				},
			},
			layouts = {
				ivy = {
					layout = {
						box = "vertical",
						backdrop = false,
						row = -1,
						width = 0,
						height = 0.5,
						border = "top",
						title = " {title} {live} {flags}",
						title_pos = "left",
						{ win = "input", height = 1, border = "bottom" },
						{
							box = "horizontal",
							{ win = "list", border = "none" },
							{ win = "preview", title = "{preview}", width = 0.5, border = "left" },
						},
					},
				},
				vertical = {
					layout = {
						backdrop = false,
						width = 0.8,
						min_width = 80,
						height = 0.8,
						min_height = 30,
						box = "vertical",
						border = "rounded",
						title = "{title} {live} {flags}",
						title_pos = "center",
						{ win = "input", height = 1, border = "bottom" },
						{ win = "list", border = "none" },
						{ win = "preview", title = "{preview}", height = 0.4, border = "top" },
					},
				},
			},
			matcher = {
				frecency = true,
			},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
						-- ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
						-- ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
						-- ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
						-- ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
						["<C-f>"] = { "toggle_live", mode = { "i", "n" } },
					},
				},
			},
		},
	},
	keys = {
		-- Git
		{
			"<leader>go",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Open in browser",
			mode = { "n", "v" },
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "File history",
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<A-g>",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.lazygit.log()
			end,
			desc = "Log",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Status",
		},

		-- Searching
		{
			"<leader><leader>",
			function()
				Snacks.picker.smart({
					filter = { cwd = true },
				})
			end,
			desc = "Smart find files",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Find command history",
		}, -- shortcut
		{
			"<leader>;",
			function()
				Snacks.picker.buffers({
					filter = { cwd = true },
				})
			end,
			desc = "Find buffers",
		}, -- shortcut
		{
			"<leader>fr",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>fb",
			function()
				Snacks.picker.buffers({
					filter = { cwd = true },
				})
			end,
			desc = "Buffers",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({
					filter = { cwd = true },
				})
			end,
			desc = "Files",
		},
		{
			"<leader>fz",
			function()
				Snacks.picker.lines()
			end,
			desc = "Grep lines",
		},
		{
			"<leader>fs",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>fS",
			function()
				Snacks.picker.pick("aerial")
			end,
			desc = "Symbols (Aerial)",
		},
		{
			"<leader>fd",
			function()
				Snacks.picker.pick("directory")
			end,
			desc = "Directory",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Word",
			mode = { "n", "x" },
		},
		{
			"<leader>fl",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Lazynvim plugins",
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.recent({
					filter = { cwd = true },
				})
			end,
			desc = "Recent",
		},
		{
			"<leader>fy",
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			"<leader>fk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix list",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		{
			"<leader>fC",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Config files",
		},
		-- {
		-- 	"<leader>fp",
		-- 	function()
		-- 		Snacks.picker.projects({
		-- 			dev = { "~/workspace" },
		-- 		})
		-- 	end,
		-- 	desc = "Projects",
		-- },
		{
			"<leader>fn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notifications",
		},
		{
			"<leader>fa",
			function()
				Snacks.picker.pickers()
			end,
			desc = "Actions",
		},
		{
			"<leader>fu",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo",
		},

		-- Lsp
		-- {
		-- 	"gd",
		-- 	function()
		-- 		Snacks.picker.lsp_definitions()
		-- 	end,
		-- 	desc = "Goto definition",
		-- },
		-- {
		-- 	"gr",
		-- 	function()
		-- 		Snacks.picker.lsp_references()
		-- 	end,
		-- 	nowait = true,
		-- 	desc = "References",
		-- },
		-- {
		-- 	"gI",
		-- 	function()
		-- 		Snacks.picker.lsp_implementations()
		-- 	end,
		-- 	desc = "Goto implementation",
		-- },
		-- {
		-- 	"gy",
		-- 	function()
		-- 		Snacks.picker.lsp_type_definitions()
		-- 	end,
		-- 	desc = "Goto type definition",
		-- },
		-- {
		-- 	"<leader>ls",
		-- 	function()
		-- 		Snacks.picker.lsp_symbols()
		-- 	end,
		-- 	desc = "LSP symbols",
		-- },

		-- Explorer
		{
			"E",
			function()
				Snacks.explorer()
			end,
			desc = "Explorer",
		},
		{
			"<leader>z",
			function()
				Snacks.zen()
				-- vim.fn.system("zellij action toggle-fullscreen")
			end,
			desc = "Zen zoom + Zellij fullscreen",
		},
	},
}
