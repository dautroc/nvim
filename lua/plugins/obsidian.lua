vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })

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
	event = "VeryLazy",
	keys = {
		-- Find
		{ "<leader>ofs", "<cmd>ObsidianSearch<CR>", desc = "Find by text" },
		{ "<leader>oft", "<cmd>ObsidianTags<CR>", desc = "Find by tag" },
		{ "<leader>ofn", "<cmd>ObsidianQuickSwitch<CR>", desc = "Find by name" },
		{ "<leader>ofd", "<cmd>ObsidianDailies<CR>", desc = "Find daily notes" },

		-- Action
		{ "<leader>on", "<cmd>lua newNoteInput()<CR>", desc = "New node" },
		{ "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Today note" },
		{ "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Open in Obsidian" },
		{ "<leader>oc", "<cmd>ObsidianToggleCheckbox<CR>", desc = "Toggle checkbox" },

		-- Link
		{ "<leader>olf", "<cmd>ObsidianFollowLink vsplit<CR>", desc = "Follow link" },
		{ "<leader>olb", "<cmd>ObsidianBacklinks<CR>", desc = "Follow back links" },
		{ "<leader>oll", "<cmd>ObsidianLinks<CR>", desc = "Show links" },
		-- Link visual
		{ "<leader>olN", "<cmd>ObsidianLinkNew<CR>", desc = "Create new note with link for selected text", mode = "v" },
		{ "<leader>oln", "<cmd>ObsidianLink<CR>", desc = "Link visual selection to a note", mode = "v" },
	},
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		dir = "~/Dropbox/obsidian",
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
      template = "daily.md",
		},
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
		mappings = {
			-- Smart action depending on context, either follow link or toggle checkbox.
			-- ["<cr>"] = {
			-- 	action = function()
			-- 		return require("obsidian").util.smart_action()
			-- 	end,
			-- 	opts = { buffer = true, expr = true },
			-- },
		},
		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.date("%Y%m%d")) .. "-" .. suffix
		end,
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
		-- Specify how to handle attachments.
		attachments = {
			-- The default folder to place images in via `:ObsidianPasteImg`.
			-- If this is a relative path it will be interpreted as relative to the vault root.
			-- You can always override this per image by passing a full path to the command instead of just a filename.
			img_folder = "assets/imgs", -- This is the default
			-- A function that determines the text to insert in the note when pasting an image.
			-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
			-- This is the default implementation.
			---@param client obsidian.Client
			---@param path obsidian.Path the absolute path to the image file
			---@return string
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				return string.format("![%s](%s)", path.name, path)
			end,
		},
	},
}
