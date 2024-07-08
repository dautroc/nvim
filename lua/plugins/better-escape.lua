return {
	"max397574/better-escape.nvim",
	config = function()
		require("better_escape").setup({
			timeout = vim.o.timeoutlen,
			mappings = {
				i = {
					j = {
						k = "<Esc>",
						j = false
					},
				},
				c = {
					j = {
						k = false,
						j = false
					},
				},
				t = {
					j = {
						k = false,
						j = false
					},
				},
				v = {
					j = {
						k = false,
					},
				},
				s = {
					j = {
						k = false,
					},
				},
			},
		})
	end,
}
