-- AI for nvim
return {
	"yetone/avante.nvim",
	event = "VeryLazy",
  enabled = false, -- Copilot is not supported, waiting for the next release
	build = "make",
	opts = {
		---@alias Provider "openai" | "claude" | "azure"  | "copilot" | [string]
		provider = "copilot",
		claude = {
			endpoint = "https://api.anthropic.com",
			model = "claude-3-5-sonnet-20240620",
			temperature = 0,
			max_tokens = 4096,
		},
		mappings = {
			ask = "<leader>ja",
			edit = "<leader>je",
			refresh = "<leader>jr",
			--- @class AvanteConflictMappings
			diff = {
				ours = "co",
				theirs = "ct",
				none = "c0",
				both = "cb",
				next = "]x",
				prev = "[x",
			},
			jump = {
				next = "]]",
				prev = "[[",
			},
			submit = {
				normal = "<CR>",
				insert = "<C-s>",
			},
			toggle = {
				debug = "<leader>jd",
				hint = "<leader>jh",
			},
		},
		hints = { enabled = true },
		windows = {
			wrap = true, -- similar to vim.o.wrap
			width = 30, -- default % based on available width
			sidebar_header = {
				align = "center", -- left, center, right for title
				rounded = true,
			},
		},
		highlights = {
			---@type AvanteConflictHighlights
			diff = {
				current = "DiffText",
				incoming = "DiffAdd",
			},
		},
		--- @class AvanteConflictUserConfig
		diff = {
			debug = false,
			autojump = true,
			---@type string | fun(): any
			list_opener = "copen",
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below is optional, make sure to setup it properly if you have lazy=true
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
