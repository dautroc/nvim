return {
	"mistricky/codesnap.nvim",
	build = "make",
  keys = {
    { "<leader>mm", "<cmd>CodeSnap<CR>", desc = "Capture code", mode = "v" },
  },
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			title = "Hello World!",
			code_font_family = "CaskaydiaCove Nerd Font",
			watermark_font_family = "Pacifico",
			watermark = "",
			bg_theme = "default",
			breadcrumbs_separator = "/",
			has_breadcrumbs = true,
		})
	end,
}
