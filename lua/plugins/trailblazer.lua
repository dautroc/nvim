return {
	"LeonHeidelbach/trailblazer.nvim",
	keys = {
		{ "mm", "<CMD>TrailBlazerNewTrailMark<CR>", desc = "Jump toggle" },
		{ "gj", "<CMD>TrailBlazerPeekMoveNextDown<CR>zz", desc = "Jump next" },
		{ "gk", "<CMD>TrailBlazerPeekMovePreviousUp<CR>zz", desc = "Jump back" },
		{ "md", "<CMD>TrailBlazerDeleteAllTrailMarks<CR>", desc = "Jump delete" },
		{ "ml", "<CMD>TrailBlazerOpenTrailMarkList<CR>", desc = "Jump list" },
	},
	config = function()
		require("trailblazer").setup({
			trail_options = {
        multiple_mark_symbol_counters_enabled = false,
        number_line_color_enabled = false,
        trail_mark_in_text_highlights_enabled = false,
        trail_mark_symbol_line_indicators_enabled = false,
        symbol_line_enabled = true,
			},
		})
	end,
}
