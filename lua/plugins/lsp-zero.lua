return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
    -- LSP
		{ "neovim/nvim-lspconfig" },
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
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
    end)

    --- if you want to know more about lsp-zero and mason.nvim
    --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require('lspconfig').lua_ls.setup(lua_opts)
        end,

        ruby_lsp = function()
          require('lspconfig').ruby_lsp.setup({})
        end,

        -- solargraph = function()
        --   require('lspconfig').solargraph.setup({})
        -- end,
      }
    })

    -- Custom servers
    local lsp_configurations = require('lspconfig.configs')
		if not lsp_configurations.fuzzy_ls then
			lsp_configurations.fuzzy_ls = {
				default_config = {
					cmd = { "fuzzy" },
					filetypes = { "ruby" },
					root_dir = function(fname)
						return require('lspconfig.util').find_git_ancestor(fname)
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
    require('lspconfig').fuzzy_ls.setup({})
  end,
}
