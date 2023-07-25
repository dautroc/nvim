return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.register({
			b = { name = "+buffer/bookmark" },
			f = {
				name = "+find",
				f = "+find and replace",
			},
			r = { name = "+rails" },
			g = { name = "+git" },
			d = { name = "+diff mode" },
			a = { name = "+alternative" },
			m = {
				name = "+misc",
			},
			t = { name = "+test" },
			k = { name = "+term" },
			o = {
				name = "+obsidian",
				l = "+links",
			},
			n = {
				name = "+neorg",
				i = {
					name = "+insert",
				},
				f = {
					name = "+find",
				},
			},
		}, { prefix = "<leader>" })
	end,
}
