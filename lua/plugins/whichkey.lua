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
			f = { name = "+find" },
			r = { name = "+rails" },
			g = { name = "+git" },
			d = { name = "+diff mode" },
			a = { name = "+alternative" },
			l = {
				name = "+lsp",
				a = "Code Action",
				r = "Rename",
				s = "Signature Help",
				i = "Lsp Info",
			},
			m = { name = "+misc" },
			t = { name = "+test" },
			o = {
				name = "+obsidian",
				l = "+links",
			},
		}, { prefix = "<leader>" })
	end,
}
