return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"jose-elias-alvarez/typescript.nvim",
		"pheen/fuzzy_ruby_server",
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

		if not configs.fuzzy_ls then
			configs.fuzzy_ls = {
				default_config = {
					cmd = { "fuzzy" },
					filetypes = { "ruby" },
					root_dir = function(fname)
						return lspconfig.util.find_git_ancestor(fname)
					end,
					settings = {},
					init_options = {
						allocationType = "ram",
						indexGems = true,
						reportDiagnostics = true,
				k},
				},
			}
		end

		lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.fuzzy_ls.setup({ on_attach = on_attach, capabilities = capabilities })
	end,
}
