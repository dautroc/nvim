return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")
		local util = require("lspconfig.util")

		if not configs.ruby_lsp then
			local enabled_features = {
				"documentHighlights",
				"documentSymbols",
				"foldingRanges",
				"selectionRanges",
				-- "semanticHighlighting",
				"formatting",
				"codeActions",
			}

			configs.ruby_lsp = {
				default_config = {
					cmd = { "bundle", "exec", "ruby-lsp" },
					filetypes = { "ruby" },
					root_dir = util.root_pattern("Gemfile", ".git"),
					init_options = {
						enabledFeatures = enabled_features,
					},
					settings = {},
				},
				commands = {
					FormatRuby = {
						function()
							vim.lsp.buf.format({
								name = "ruby_lsp",
								async = true,
							})
						end,
						description = "Format using ruby-lsp",
					},
				},
			}
		end

		lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
	end,
}
