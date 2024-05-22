return {
	"mistricky/codesnap.nvim",
	build = "make",
  keys = {
    { "<leader>mm", "<cmd>CodeSnap<CR>", desc = "Capture code", mode = "v" },
  },
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			code_font_family = "JetBrains Mono",
			watermark_font_family = "Monaspace Radon Var",
			watermark = "Loi Loi",
			bg_theme = "default",
			breadcrumbs_separator = "/",
			has_breadcrumbs = true,
		})
	end,
}
