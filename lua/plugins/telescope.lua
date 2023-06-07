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
		{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Find a string" },
		{ "<leader>b", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
	},
	opts = {
		defaults = {
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			file_ignore_patterns = { ".git/", "node_modules", ".idea" },
			mappings = {
				i = {
					["<esc>"] = "close",
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
	},
}
