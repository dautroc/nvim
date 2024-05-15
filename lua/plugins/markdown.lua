return {
	"MeanderingProgrammer/markdown.nvim",
	name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
	keys = {
		{ "<leader>mp", "<cmd>RenderMarkdownToggle<CR>", desc = "Markdown Preview" },
	},
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("render-markdown").setup({})
	end,
}
