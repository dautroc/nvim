return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"AckslD/nvim-neoclip.lua",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		"tsakirist/telescope-lazy.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	keys = {
		-- Vim mappings
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
		{ "<leader>fj", "<cmd>Telescope buffers<CR>", desc = "Buffer jump" },

		-- Find everything
		{ "<leader>fr", "<cmd>Telescope resume<CR>", desc = "Resume" },
		{ "<leader>fu", "<cmd>Telescope undo<CR>", desc = "Undo" },
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Buffers" },
		{ "<leader>fp", "<cmd>Telescope project<CR>", desc = "Projects" },
		{ "<leader>fy", "<cmd>Telescope neoclip<CR>", desc = "Yanked text" },
		{
			"<leader>fw",
			"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>",
			desc = "Grep string",
		},
		{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
		{ "<leader><leader>", "<cmd>Telescope smart_open<CR>", desc = "Files" },
		{ "<leader>fo", "<cmd>Telescope frecency workspace=CWD<CR>", desc = "Old files" },
		{ "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy finder" },
		{ "<leader>fl", "<cmd>Telescope lazy<CR>", desc = "Lazy" },
		{
			"<leader>fs",
			"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
			desc = "Live grep args",
		},

		-- Rails
		{ "<leader>ra", "<cmd>Telescope find_files cwd=app/api<CR>", desc = "[A]pi" },
		{ "<leader>rv", "<cmd>Telescope find_files cwd=app/views<CR>", desc = "[V]iews" },
		{ "<leader>rt", "<cmd>Telescope find_files cwd=lib/tasks<CR>", desc = "[T]asks" },
		{ "<leader>rm", "<cmd>Telescope find_files cwd=app/models<CR>", desc = "[M]odels" },
		{ "<leader>rM", "<cmd>Telescope find_files cwd=db/migrate<CR>", desc = "[M]igrates" },
		{ "<leader>ri", "<cmd>Telescope find_files cwd=app/mailers<CR>", desc = "ma[I]lers" },
		{ "<leader>rs", "<cmd>Telescope find_files cwd=app/services<CR>", desc = "[S]ervices" },
		{ "<leader>rp", "<cmd>Telescope find_files cwd=app/policies<CR>", desc = "[P]olicies" },
		{ "<leader>rf", "<cmd>Telescope find_files cwd=spec/factories<CR>", desc = "[F]actories" },
		{ "<leader>rl", "<cmd>Telescope find_files cwd=config/locales<CR>", desc = "[L]ocales" },
		{ "<leader>rc", "<cmd>Telescope find_files cwd=app/controllers<CR>", desc = "[C]ontrollers" },
	},
	config = function()
		require("neoclip").setup()

		local lga_actions = require("telescope-live-grep-args.actions")
		-- local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				-- Layout config
				layout_strategy = "bottom_pane",
				layout_config = {
					height = 0.3,
				},
				border = true,

				sorting_strategy = "ascending",
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = {
					filename_first = {
						reverse_directories = false,
					},
				},
				file_ignore_patterns = { ".git/", "node_modules", ".idea", "vendor" },
				mappings = {
					i = {
						["<esc>"] = "close",
						["<C-u>"] = false,
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
					},
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				oldfiles = {
					cwd_only = true,
					path_display = {
						filename_first = {
							reverse_directories = false,
						},
					},
					previewer = true,
				},
				find_files = {
					previewer = true,
				},
				buffers = {
					previewer = true,
				},
				current_buffer_fuzzy_find = {
					previewer = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
				},

				project = {
					base_dirs = {
						{ path = "~/workspace", max_depth = 2 },
						{ path = "~/.config/nvim", max_depth = 1 },
					},
					hidden_files = true, -- default: false
					order_by = "asc",
					search_by = "title",
					sync_with_nvim_tree = false, -- default false
				},

				live_grep_args = {
					auto_quoting = true,
					mappings = {
						i = {
							["<C-f>"] = lga_actions.quote_prompt({ postfix = " -F app/" }),
							["<esc>"] = "close",
							["<C-u>"] = false,
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
				},

				lazy = {
					-- <C-o>	Open selected plugin repository in browser
					-- <M-b>	Open selected plugin with file-browser
					-- <C-f>	Open selected plugin with find files
					-- <C-g>	Open selected plugin with live grep (will use egrepify if installed)
					-- <C-t>	Open selected plugin in a terminal
					-- <C-b>	Open lazy plugins picker, works only after having called first another action
					-- <C-r>f	Open lazy root with find files
					-- <C-r>g	Open lazy root with live grep (will use egrepify if installed)
					-- <C-c>d	Change the current working directory to the path of the selected plugin

					-- Optional theme (the extension doesn't set a default theme)
					theme = "ivy",
					-- The below configuration options are the defaults
					show_icon = true,
					mappings = {
						open_in_browser = "<C-o>",
						open_in_file_browser = "<M-b>",
						open_in_find_files = "<C-f>",
						open_in_live_grep = "<C-g>",
						open_in_terminal = "<C-t>",
						open_plugins_picker = "<C-b>",
						open_lazy_root_find_files = "<C-r>f",
						open_lazy_root_live_grep = "<C-r>g",
						change_cwd_to_plugin = "<C-c>d",
					},
					actions_opts = {
						open_in_browser = {
							auto_close = false,
						},
						change_cwd_to_plugin = {
							auto_close = false,
						},
					},
					terminal_opts = {
						relative = "editor",
						style = "minimal",
						border = "rounded",
						title = "Telescope lazy",
						title_pos = "center",
						width = 0.5,
						height = 0.5,
					},
				},

				smart_open = {
					cwd_only = true,
				},
			},
		})

		-- Extensions
		local extensions = {
			"fzf",
			"project",
			"live_grep_args",
			"neoclip",
			"undo",
			"frecency",
			"lazy",
		}
		for _, ext in ipairs(extensions) do
			require("telescope").load_extension(ext)
		end
	end,
}
