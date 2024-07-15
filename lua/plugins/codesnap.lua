return {
	"mistricky/codesnap.nvim",
	event = "BufRead",
	build = "make",
	keys = {
		{ "<leader>mm", "<cmd>CodeSnap<CR>", desc = "Capture code", mode = "v" },
	},
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			code_font_family = "JetBrains Mono",
			watermark_font_family = "Monaspace Radon Var",
			watermark = "",
			bg_theme = "default",
			breadcrumbs_separator = "/",
			has_line_number = true,
			has_breadcrumbs = true,
			show_workspace = true,
      bg_x_padding = 20,
      bg_y_padding = 20,
		})
	end,
}
