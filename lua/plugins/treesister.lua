return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	dependencies = {
		"RRethy/nvim-treesitter-endwise", -- Needed to prevent treesitter ident issue with Ruby: https://github.com/tree-sitter/tree-sitter-ruby/issues/230#issuecomment-1312403487
	},
	config = function()
		-- Using protected call
		local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		treesitter_config.setup({
			ensure_installed = require("utils").parsers,
			sync_install = false,

			matchup = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			indent = { enable = true, disable = { "python", "css" } },
		})
	end,
}
