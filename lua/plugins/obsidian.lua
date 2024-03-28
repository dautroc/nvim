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
		{ "<leader>oss", "<cmd>ObsidianSearch<CR>", desc = "Search by text" },
		{ "<leader>ost", "<cmd>ObsidianTags<CR>", desc = "Search by tag" },
		{ "<leader>osn", "<cmd>ObsidianQuickSwitch<CR>", desc = "Search by name" },
		{ "<leader>osd", "<cmd>ObsidianDailies<CR>", desc = "Search dailies" },

    -- Action
		{ "<leader>oan", "<cmd>lua newNoteInput()<CR>", desc = "New node" },
		{ "<leader>oar", "<cmd>ObsidianRename<CR>", desc = "Rename note" },

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
