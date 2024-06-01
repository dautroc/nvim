return {
	"nvim-lualine/lualine.nvim",
	enabled = false,
	lazy = false,
	config = function()
		-- Using protected call
		local status_ok, lualine = pcall(require, "lualine")
		if not status_ok then
			return
		end
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = true,
			always_visible = true,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		local filetype = {
			"filetype",
			icons_enabled = true,
		}

		local location = {
			"location",
			padding = 0,
		}

		local filename = {
			"filename",
			path = 1,
		}

		lualine.setup({
			options = {
				globalstatus = true,
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = { "alpha", "dashboard" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "tabs", "mode" },
				lualine_b = { "branch", "diff", diagnostics },
				lualine_c = { filename },
				lualine_x = { diff, "encoding", filetype },
				lualine_y = { location },
				lualine_z = { "progress" },
			},
		})
	end,
}
