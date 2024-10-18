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
      -- e for tree explorer
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>gd", group = "diffview" },
			{ "<leader>h", group = "help" },
			{ "<leader>i", group = "terms" },
      -- j is available
      -- k is available
			{ "<leader>l", group = "lsp" },
			{ "<leader>lt", desc = "+trouble" },
			{ "<leader>m", group = "misc" },
			{ "<leader>n", group = "neo-tree" },
			{ "<leader>o", group = "obsidian" },
			{ "<leader>of", group = "find" },
			{ "<leader>ol", group = "link" },
      -- p is available
      -- q is for quit
			{ "<leader>r", group = "rails" },
			{ "<leader>s", group = "session" },
			{ "<leader>t", group = "test" },
			{ "<leader>u", group = "utils" },
      -- v for vertical split
      -- w for write buffer
      -- y is available
      -- z is for zen mode
		})

		wk.add({
			{
				mode = { "v" },
				{ "<leader>a", group = "+avante" },
				{ "<leader>g", group = "git" },
				{ "<leader>gd", group = "diffview" },
				{ "<leader>o", group = "obsidian" },
				{ "<leader>ol", group = "link" },
			},
		})
	end,
}
