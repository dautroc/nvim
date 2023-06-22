return {
	"echasnovski/mini.nvim",
	keys = {
		{ "<leader>.", "<CMD>lua MiniFiles.open()<CR>", desc = "Mini files" },
	},
	version = false,
	config = function()
		require("mini.files").setup()
	end,
}
