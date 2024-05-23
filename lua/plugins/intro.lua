return {
	"OXY2DEV/intro.nvim",
	config = function()
		require("intro").setup({
			preset = {
				name = "nvim",
				opts = { "animated" },
			},
			merge = false,

			showStatusline = false,
			shadaValidate = false,

			anchors = {
				position = "bottom",
				corner = "▒",

				textStyle = { bg = "#BAC2DE", fg = "#181825" },
				cornerStyle = { bg = "#BAC2DE", fg = "#181825" },
			},
			pathModifiers = {},
			openFileUnderCursor = "<leader><leader>",

			components = {},
			globalHighlights = {},

			animations = {
				delay = 0,
				updateDelay = 200,

				highlightBased = {},
				textBased = {},
			},
		})
	end,
}
