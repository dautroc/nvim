return {
	"caenrique/swap-buffers.nvim",
	keys = {
		{ "<C-left>", "<cmd>lua require('swap-buffers').swap_buffers('h')<CR>", desc = "Swap left" },
		{ "<C-down>", "<cmd>lua require('swap-buffers').swap_buffers('j')<CR>", desc = "Swap down" },
		{ "<C-up>", "<cmd>lua require('swap-buffers').swap_buffers('k')<CR>", desc = "Swap up" },
		{ "<C-right>", "<cmd>lua require('swap-buffers').swap_buffers('l')<CR>", desc = "Swap right" },
	},
}
