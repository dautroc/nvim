return {
	finder = function(opts, ctx)
		local filter = ctx.filter
		local items = {}

		local ok, dirs = pcall(vim.fn.systemlist, "fd --type d --hidden --exclude .git")
		if not ok then
			vim.notify("Failed to list directories: " .. dirs, vim.log.levels.ERROR)
			return {}
		end

		local cwd = vim.fn.getcwd()
		for idx, dir in ipairs(dirs) do
			local item = {
				idx = idx,
				text = dir,
				dir = dir,
				score = 1,
				file = vim.fn.fnamemodify(cwd .. "/" .. dir, ":p"),
				icon = "󰉋 ", -- folder icon
				highlights = {
					{
						{ "󰉋 ", "Directory" }, -- highlight folder icon
						{ dir, "Normal" }, -- highlight path
					},
				},
			}

			if filter:match(item) then
				table.insert(items, item)
			end
		end

		return items
	end,

	format = "file",

	preview = "directory",
	layout = {
    preset = "ivy",
    cycle = false,
	},

	prompt = "❯ ",
	actions = {
		["<c-x>"] = { "edit_split", mode = { "i", "n" } },
		["<c-v>"] = { "edit_vsplit", mode = { "i", "n" } },
	},
	confirm = function(picker, item)
		picker:close()
		if item and item.dir then
			local path = vim.fn.getcwd() .. "/" .. item.dir
			Snacks.picker.files({ cwd = path })
		end
	end,
}
