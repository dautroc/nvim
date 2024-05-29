return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"AckslD/nvim-neoclip.lua",
		"nvim-telescope/telescope-frecency.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"debugloop/telescope-undo.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	keys = {
		-- Vim mappings
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },

		-- Find everything
		{ "<leader>fr", "<cmd>Telescope resume<CR>", desc = "Resume" },
		{ "<leader>fu", "<cmd>Telescope undo<CR>", desc = "Undo" },
		{ "<leader>ff", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fb", "<cmd>Telescope file_browser files=false<CR>", desc = "File browers" },
		{ "<leader>fp", "<cmd>Telescope project<CR>", desc = "Projects" },
		{ "<leader>fy", "<cmd>Telescope neoclip<CR>", desc = "Yanked text" },
		{ "<leader>fY", "<cmd>call SearchYamlKey()<CR>", desc = "Yaml" },
		{
			"<leader>fw",
			"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<CR>",
			desc = "Grep string",
		},
		{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
		{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Files" },
		{ "<leader>fo", "<cmd>Telescope frecency workspace=CWD<CR>", desc = "Frecency files" },
		{ "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy finder" },
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
					path_display = { "absolute" },
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
				file_browser = {
					theme = "ivy",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						["i"] = {
							["<esc>"] = "close",
							["<C-u>"] = false,
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
						},
					},
				},
			},
		})

		-- Extensions
		local extensions = {
			"fzf",
			"project",
			"live_grep_args",
			"neoclip",
			"frecency",
			"file_browser",
      "undo",
		}
		for _, ext in ipairs(extensions) do
			require("telescope").load_extension(ext)
		end
	end,
}
