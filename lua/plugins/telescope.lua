return {
	"nvim-telescope/telescope.nvim",
	cmd = { "Telescope" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "AckslD/nvim-neoclip.lua",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	keys = {
		{ "<leader><leader>", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
		{ "<leader>fr", "<cmd>Telescope resume<CR>", desc = "Resume" },
		{ "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fw", "<cmd>Telescope grep_string<CR>", desc = "Grep string" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Old files" },
		{ "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Buffer fuzzy find" },
		{ "<leader>fp", "<cmd>Telescope project<CR>", desc = "Project" },
    { "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", desc = "Live grep args" },
    { "<leader>fn", "<cmd>lua require('utils.telescope').grep_at_current_tree_node()<CR>", desc = "Grep at current tree node" },

		-- Rails
		{ "<leader>rm", "<cmd>Telescope find_files cwd=app/models<CR>", desc = "rails models" },
		{ "<leader>rs", "<cmd>Telescope find_files cwd=app/services<CR>", desc = "rails services" },
		{ "<leader>rc", "<cmd>Telescope find_files cwd=app/controllers<CR>", desc = "rails controllers" },
		{ "<leader>ra", "<cmd>Telescope find_files cwd=app/api<CR>", desc = "rails api" },
		{ "<leader>rp", "<cmd>Telescope find_files cwd=app/policies<CR>", desc = "rails policies" },
		{ "<leader>ri", "<cmd>Telescope find_files cwd=app/mailers<CR>", desc = "rails mailer" },
		{ "<leader>rf", "<cmd>Telescope find_files cwd=spec/factories<CR>", desc = "rails factories" },
		{ "<leader>rl", "<cmd>Telescope find_files cwd=config/locales<CR>", desc = "rails locales" },
		{ "<leader>rr", "<cmd>Telescope find_files cwd=lib/tasks<CR>", desc = "rake tasks" },
		{ "<leader>rv", "<cmd>Telescope find_files cwd=app/views<CR>", desc = "rails views" },
	},
	config = function()
    require("neoclip").setup()

    local lga_actions = require("telescope-live-grep-args.actions")
		require("telescope").setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },
				file_ignore_patterns = { ".git/", "node_modules", ".idea" },
				mappings = {
					i = {
						[";"] = "close",
						["<esc>"] = "close",
            ["<C-k>"] = lga_actions.quote_prompt(),

            -- Filter by file type
            ["<C-f>"] = lga_actions.quote_prompt({
              postfix = " -g ",
            }),
            ["<C-d>"] = lga_actions.quote_prompt({
              postfix = " -g **/dir/** ",
            }),
            ["<C-i>"] = lga_actions.quote_prompt({
              postfix = " --iglob ",
            }),
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
				project = {
					project = {
						base_dirs = {
							{ path = "~/workspace", max_depth = 2 },
							{ path = "~/nvim", max_depth = 1 },
						},
						hidden_files = true, -- default: false
						theme = "dropdown",
						order_by = "asc",
						search_by = "title",
						sync_with_nvim_tree = true, -- default false
					},
				},
			},
		})

		-- Extensions
		local extensions = { "fzf", "project", "live_grep_args", "neoclip" }
		for _, ext in ipairs(extensions) do
			require("telescope").load_extension(ext)
		end
	end,
}
