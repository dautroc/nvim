return {
	"numToStr/Navigator.nvim",
	enabled = true,
	keys = {
		{ "<C-h>", "<cmd>NavigatorLeft<CR>", mode = { "n", "t" } },
		{ "<C-j>", "<cmd>NavigatorDown<CR>", mode = { "n", "t" } },
		{ "<C-k>", "<cmd>NavigatorUp<CR>", mode = { "n", "t" } },
		{ "<C-l>", "<cmd>NavigatorRight<CR>", mode = { "n", "t" } },
	},
	config = function()
		require("Navigator").setup()
	end,
}
