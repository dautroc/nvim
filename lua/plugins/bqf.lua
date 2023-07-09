return {
	"kevinhwang91/nvim-bqf",
	dependencies = {
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	},
}
