return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	keys = {
		{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Grep string" },
		{ "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Old files" },
		{ "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer fuzzy find" },

		-- Rails
		{ "<leader>rm", ":Telescope find_files cwd=app/models<CR>", desc = "rails models" },
		{ "<leader>rs", ":Telescope find_files cwd=app/services<CR>", desc = "rails services" },
		{ "<leader>rc", ":Telescope find_files cwd=app/controllers<CR>", desc = "rails controllers" },
		{ "<leader>ra", ":Telescope find_files cwd=app/api<CR>", desc = "rails api" },
		{ "<leader>rp", ":Telescope find_files cwd=app/policies<CR>", desc = "rails policies" },
		{ "<leader>ri", ":Telescope find_files cwd=app/mailers<CR>", desc = "rails mailer" },
		{ "<leader>rf", ":Telescope find_files cwd=spec/factories<CR>", desc = "rails factories" },
		{ "<leader>rl", ":Telescope find_files cwd=config/locales<CR>", desc = "rails locales" },
		{ "<leader>rr", ":Telescope find_files cwd=lib/tasks<CR>", desc = "rake tasks" },
		{ "<leader>rv", ":Telescope find_files cwd=app/views<CR>", desc = "rails views" },
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			file_ignore_patterns = { ".git/", "node_modules", ".idea" },
			mappings = {
				i = {
					[";"] = "close",
					["<esc>"] = "close",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			oldfiles = {
				cwd_only = true,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
			},
		},
	},
}
