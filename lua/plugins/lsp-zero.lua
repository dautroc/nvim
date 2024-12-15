return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "netmute/ctags-lsp.nvim" },
		{
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.api.nvim_command, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" },

		-- Autocompletion
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
    -- LSP Configuration
		local lspconfig = require("lspconfig")
		lspconfig.ctags_lsp.setup({}) -- Setup ctags-lsp

		-- Custom servers for fuzzy-ls
		local lsp_configurations = require("lspconfig.configs")
		if not lsp_configurations.fuzzy_ls then
			lsp_configurations.fuzzy_ls = {
				default_config = {
					cmd = { "fuzzy" },
					filetypes = { "ruby" },
					root_dir = function(fname)
						return require("lspconfig.util").find_git_ancestor(fname)
					end,
					settings = {},
					init_options = {
						allocationType = "ram",
						indexGems = true,
						reportDiagnostics = true,
					},
				},
			}
		end
		lspconfig.fuzzy_ls.setup({})

    -- LSP-Zero Configuration
		local lsp_zero = require("lsp-zero")

		local lsp_attach = function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end

		lsp_zero.extend_lspconfig({
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			lsp_attach = lsp_attach,
			float_border = "rounded",
			sign_text = true,
		})

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		--- if you want to know more about lsp-zero and mason.nvim
		--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
		require("mason").setup({})
		require("mason-lspconfig").setup({})
	end,
}
