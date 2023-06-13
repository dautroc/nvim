return {
	keys = {
		{ "<leader>mtd", "<cmd>set background=dark<cr>", desc = "Set dark theme" },
		{ "<leader>mtl", "<cmd>set background=light<cr>", desc = "Set light theme" },
	},
	"sainnhe/gruvbox-material",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.cmd([[colorscheme gruvbox-material]])
	end,
}
