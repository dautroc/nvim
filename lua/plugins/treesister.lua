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
      auto_install = true,
      ignore_install = {},
			highlight = { enable = true },
      incremental_selection = {
        enable = false,
        -- Conflicts keymaps with other plugins
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
			indent = { enable = true },
			matchup = { enable = true },
		})
	end,
}
