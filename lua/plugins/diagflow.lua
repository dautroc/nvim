return {
	"dgagn/diagflow.nvim",
	opts = {
		max_width = 60, -- The maximum width of the diagnostic messages
		severity_colors = {
			-- The highlight groups to use for each diagnostic severity level
			error = "DiagnosticFloatingError",
			warning = "DiagnosticFloatingWarning",
			info = "DiagnosticFloatingInfo",
			hint = "DiagnosticFloatingHint",
		},
		gap_size = 1,
		scope = "cursor", -- 'cursor', 'line',
	},
  event = "VeryLazy"
}
