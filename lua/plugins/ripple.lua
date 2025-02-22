return {
	"ian-howell/ripple.nvim",
	config = function()
		require("ripple").setup({
			keys = {
				expand_up = "<up>",
				expand_down = "<down>",
				expand_right = "<right>",
				expand_left = "<left>",
			},
		})
	end,
}
