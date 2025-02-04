local function codecompanion_adapter_name()
	local chat = require("codecompanion").buf_get_chat(vim.api.nvim_get_current_buf())
	if not chat then
		return nil
	end

	return " " .. chat.adapter.formatted_name
end

local function codecompanion_current_model_name()
	local chat = require("codecompanion").buf_get_chat(vim.api.nvim_get_current_buf())
	if not chat then
		return nil
	end

	return chat.settings.model
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {
			{
				filetypes = { "codecompanion" },
				sections = {
					lualine_a = {
						mode,
					},
					lualine_b = {
						codecompanion_adapter_name,
					},
					lualine_c = {
						codecompanion_current_model_name,
					},
					lualine_x = {},
					lualine_y = {
						"progress",
					},
					lualine_z = {
						"location",
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {
						codecompanion_adapter_name,
					},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {
						"progress",
					},
					lualine_z = {},
				},
			},
		},
	},
}
