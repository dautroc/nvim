return {
	"boltlessengineer/smart-tab.nvim",
	config = function()
		require("smart-tab").setup({
			-- default options:
			-- list of tree-sitter node types to filter
			skips = { "string_content" },
			-- default mapping, set `false` if you don't want automatic mapping
			mapping = "<tab>",
		})
	end,
}
