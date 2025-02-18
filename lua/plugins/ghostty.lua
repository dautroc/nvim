return {
	-- Automatically validate your Ghostty configuration on save
	{
		"isak102/ghostty.nvim",
		config = function()
			require("ghostty").setup()
		end,
	},
	-- Tree-sitter grammar for Ghostty configuration files
	{
		"bezhermoso/tree-sitter-ghostty",
		build = "make nvim_install",
	},
}
