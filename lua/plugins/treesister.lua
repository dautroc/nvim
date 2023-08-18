return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufReadPre",
	dependencies = {
		"RRethy/nvim-treesitter-endwise", -- Needed to prevent treesitter ident issue with Ruby: https://github.com/tree-sitter/tree-sitter-ruby/issues/230#issuecomment-1312403487
		"windwp/nvim-ts-autotag",
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

			highlight = {
				enable = true,
			},
			indent = { enable = true, disable = { "python", "css" } },

			-- Integration with other plugins
			autopairs = { -- require autopairs plugin
				enable = true,
			},
			autotag = { -- require autotag plugin
				enable = true,
				filetypes = { "html", "xml", "eruby", "erb", "embedded_template" },
			},
			context_commentstring = { -- require ts-comment string plugin
				enable = true,
				enable_autocmd = false,
			},
		})
	end,
}
