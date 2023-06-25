return {
	"epwalsh/obsidian.nvim",
	keys = {
		{ "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Create a new daily note" },
		{ "<leader>on", "<cmd>ObsidianNew new_note<CR>", desc = "Create new node" },
		{ "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Open in obsidian" },
		{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search notes" },
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find by name" },

    -- Link
		{ "<leader>olf", "<cmd>ObsidianFollowLink<CR>", desc = "Follow link" },
		{ "<leader>oln", "<cmd>ObsidianLinkNew<CR>", desc = "Create new note with link for selected text", mode = "v" },
		{ "<leader>oll", "<cmd>ObsidianLink<CR>", desc = "Link selected text to a note", mode = "v" },
	},
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		dir = "~/Dropbox/obsidian",
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
		},
		completion = {
			nvim_cmp = true,
		},
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M"
    }
  },
}
