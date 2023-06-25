return {
	"echasnovski/mini.nvim",
	keys = {
		{ "<leader>e", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Mini file current" },
		{ "<leader>E", "<CMD>lua MiniFiles.open()<CR>", desc = "Mini file root" },
	},
	version = false,
	config = function()
		require("mini.splitjoin").setup()
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "h",
				go_out_plus = "H",
				reset = "<BS>",
				show_help = "g?",
				synchronize = "w",
				trim_left = "<",
				trim_right = ">",
			},
		})
	end,
}
