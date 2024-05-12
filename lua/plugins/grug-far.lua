return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({})
	end,
	keys = {
		{ "<leader>fR", "<cmd>GrugFar<CR>", desc = "Find and Replace" },
	},
}
