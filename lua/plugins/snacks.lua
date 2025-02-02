return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		dashboard = {
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
		picker = {
			transform = function(item)
				if not item.file then
					return item
				end
				-- Demote the "lazyvim" keymaps file:
				if item.file:match("lazyvim/lua/config/keymaps%.lua") then
					item.score_add = (item.score_add or 0) - 30
				end
				-- Boost the "neobean" keymaps file:
				-- if item.file:match("neobean/lua/config/keymaps%.lua") then
				--   item.score_add = (item.score_add or 0) + 100
				-- end
				return item
			end,
			-- In case you want to make sure that the score manipulation above works
			-- or if you want to check the score of each file
			debug = {
				scores = true, -- show scores in the list
			},
			-- I like the "ivy" layout, so I set it as the default globaly, you can
			-- still override it in different keymaps
			layout = {
				preset = "ivy",
				-- When reaching the bottom of the results in the picker, I don't want
				-- it to cycle and go back to the top
				cycle = false,
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
				-- I wanted to modify the layout width
				--
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
						-- to close the picker on ESC instead of going to normal mode,
						-- add the following keymap to your config
						["<Esc>"] = { "close", mode = { "n", "i" } },
						-- I'm used to scrolling like this in LazyGit
						["J"] = { "preview_scroll_down", mode = { "i", "n" } },
						["K"] = { "preview_scroll_up", mode = { "i", "n" } },
						["H"] = { "preview_scroll_left", mode = { "i", "n" } },
						["L"] = { "preview_scroll_right", mode = { "i", "n" } },
					},
				},
			},
		},
	},
	keys = {
		-- Scratch
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},

		-- Notifications
		{
			"<leader>nh",
			function()
				Snacks.notifier.show_history()
			end,
			desc = "Notification History",
		},
		{
			"<leader>nd",
			function()
				Snacks.notifier.hide()
			end,
			desc = "Dismiss All Notifications",
		},

		-- Git
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git open in browser",
			mode = { "n", "v" },
		},
		{
			"<leader>gf",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit Current File History",
		},
		{
			"<leader>gg",
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
			desc = "Lazygit Log (cwd)",
		},

		-- Neovim news
		{
			"<leader>N",
			desc = "Neovim News",
			function()
				Snacks.win({
					file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
					width = 0.6,
					height = 0.6,
					wo = {
						spell = false,
						wrap = false,
						signcolumn = "yes",
						statuscolumn = " ",
						conceallevel = 3,
					},
				})
			end,
		},

		{
			"<leader>fF",
			function()
				Snacks.picker.files({
					finder = "files",
					format = "file",
					show_empty = true,
					supports_live = true,
					-- In case you want to override the layout for this keymap
					-- layout = "vscode",
				})
			end,
			desc = "Find Files",
		},
		{
			"<leader>fB",
			function()
				Snacks.picker.buffers({
					-- I always want my buffers picker to start in normal mode
					on_show = function()
						vim.cmd.stopinsert()
					end,
					finder = "buffers",
					format = "buffer",
					hidden = false,
					unloaded = true,
					current = true,
					sort_lastused = true,
					win = {
						input = {
							keys = {
								["d"] = "bufdelete",
							},
						},
						list = { keys = { ["d"] = "bufdelete" } },
					},
					-- In case you want to override the layout for this keymap
					-- layout = "ivy",
				})
			end,
			desc = "[P]Snacks picker buffers",
		},
		--
		--    -- LLM intergration
		--    {
		--      "<C-c>",
		--      desc = "AI Commit Msg",
		--      function()
		--        vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true)
		--        vim.api.nvim_command("LLMAppHandler CommitMsg")
		--      end,
		--      mode = "t",
		--    },
	},
}
