return {
	"echasnovski/mini.nvim",
	keys = {
		{ "<leader>e", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Mini file current" },
		{ "<leader>E", "<CMD>lua MiniFiles.open()<CR>", desc = "Mini file root" },
	},
	version = false,
	config = function()
		require("mini.splitjoin").setup()
		require("mini.files").setup()
	end,
}