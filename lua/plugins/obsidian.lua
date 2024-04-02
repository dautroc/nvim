function newNoteInput()
	local user_input = vim.fn.input("New note name: ")
	if user_input ~= "" then
		vim.cmd("ObsidianNew " .. user_input)
	else
		vim.cmd("normal! :")
		print("No note name provided")
	end
end

return {
	"epwalsh/obsidian.nvim",
	keys = {
		{ "<leader>ofs", "<cmd>ObsidianSearch<CR>", desc = "Find by text" },
		{ "<leader>oft", "<cmd>ObsidianTags<CR>", desc = "Find by tag" },
		{ "<leader>ofn", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find by name" },
		{ "<leader>ofd", "<cmd>ObsidianDailies<CR>", desc = "Find daily notes" },

		-- Action
		{ "<leader>on", "<cmd>lua newNoteInput()<CR>", desc = "New node" },
		{ "<leader>or", "<cmd>ObsidianRename<CR>", desc = "Rename note" },
		{ "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Today note" },

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
			enable = false, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			-- Define how various check-boxes are displayed
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
	},
}
