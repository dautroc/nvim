return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		wk.add({
			{ "<leader>a", group = "alternative" },
			{ "<leader>b", group = "buffer/bookmark" },
			{ "<leader>c", group = "qfixlist" },
			{ "<leader>d", group = "devdocs" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>gd", group = "diffview" },
			{ "<leader>h", group = "help" },
			{ "<leader>i", group = "terms" },
			{ "<leader>j", group = "journal" },
			{ "<leader>l", group = "lsp" },
			{ "<leader>lt", desc = "+trouble" },
			{ "<leader>m", group = "misc" },
			{ "<leader>mu", group = "utils" },
			{ "<leader>o", group = "obsidian" },
			{ "<leader>of", group = "find" },
			{ "<leader>ol", group = "link" },
			{ "<leader>r", group = "rails" },
			{ "<leader>s", group = "session" },
			{ "<leader>t", group = "test" },
		})

		wk.add({
			{
				mode = { "v" },
				{ "<leader>g", group = "git" },
				{ "<leader>gd", group = "diffview" },
				{ "<leader>o", group = "obsidian" },
				{ "<leader>ol", group = "link" },
			},
		})
	end,
}
