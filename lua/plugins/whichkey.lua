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
			i = { name = "+terms" },
			f = {
				name = "+find",
				R = "+find and replace",
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
			},
			t = { name = "+test" },
			l = { name = "+lsp" },
			o = {
				name = "+obsidian",
				f = { name = "+find" },
        l = { name = "+link" },
			},
			h = {
				name = "+help",
			},
      R = {
        name = "+spectre",
      },
      s = {
        name = "+session",
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
