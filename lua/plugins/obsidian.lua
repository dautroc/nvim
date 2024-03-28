function newNoteInput()
	local user_input = vim.fn.input("New note name: ")
  if user_input ~= '' then
    vim.cmd("ObsidianNew " .. user_input)
  else
    vim.cmd('normal! :')
    print("No note name provided")
  end
end

return {
	"epwalsh/obsidian.nvim",
	keys = {
		{ "<leader>ofs", "<cmd>ObsidianSearch<CR>", desc = "Find by text" },
		{ "<leader>oft", "<cmd>ObsidianTags<CR>", desc = "Find by tag" },
		{ "<leader>ofh", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find by name" },
		{ "<leader>ofd", "<cmd>ObsidianDailies<CR>", desc = "Find dailies" },

    -- Action
		{ "<leader>on", "<cmd>lua newNoteInput()<CR>", desc = "New node" },
		{ "<leader>or", "<cmd>ObsidianRename<CR>", desc = "Rename note" },

    -- Link
		{ "<leader>olf", "<cmd>ObsidianFollowLink vsplit<CR>", desc = "Follow link" },
		{ "<leader>olb", "<cmd>ObsidianBacklinks<CR>", desc = "Follow back links" },
		{ "<leader>oll", "<cmd>ObsidianLinks<CR>", desc = "Show links" },
		{ "<leader>olN", "<cmd>ObsidianLinkNew<CR>", desc = "Create new note with link for selected text", mode = "v" },
		{ "<leader>oln", "<cmd>ObsidianLink<CR>", desc = "Link visual selection to a note", mode = "v" },
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
			time_format = "%H:%M",
		},
		mappings = {},
		ui = {
			enable = false,
		},
	},
}
