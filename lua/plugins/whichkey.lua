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
			d = { name = "+devdocs" },
			c = { name = "+qfixlist" },
			f = {
				name = "+find",
				f = "+find and replace",
			},
			r = {
				name = "+rails",
			},
			g = {
				name = "+git",
				d = { name = "+diffview" },
			},
			a = { name = "+alternative" },
			m = {
				name = "+misc",
				u = { name = "+utils" },
				T = { name = "Toggle Theme" },
			},
			t = { name = "+test" },
			l = { name = "+lsp" },
			o = {
				name = "+obsidian",
				s = { name = "+search" },
				a = { name = "+action" },
        l = { name = "+link" },
			},
			h = {
				name = "+help",
			},
		}, { prefix = "<leader>" })

    wk.register({
      g = {
        name = "+git",
        d = { name = "+diffview" },
      },
      o = {
        name = "+obsidian",
        l = { name = "+link" },
      }
    }, { prefix = "<leader>", mode = "v" })
	end,
}
