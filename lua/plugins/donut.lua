return {
	"NStefan002/donut.nvim",
	version = "*",
	enabled = false,
	lazy = false,
	config = function()
		require("donut").setup({
			timeout = 60,
			sync_donuts = true,
		})

		-- Donut
		vim.cmd("autocmd VimEnter * Donut")
	end,
}
