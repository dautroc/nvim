return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ -- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.api.nvim_command, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
	},
	config = function()
		local lsp = require("lsp-zero").preset({})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, silent = true }
			-- lsp.default_keymaps({ buffer = bufnr })

			-- vim.keymap.set("n", "gq", "<cmd>lua vim.lsp.buf.format({ async=true })<cr>", opts)
			-- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
			-- vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
			-- vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)

			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
			vim.keymap.set("n", "gr", "<cmd>Lspsaga finder ref+def<cr>", opts)
			vim.keymap.set("n", "gR", "<cmd>Lspsaga rename<cr>", opts)
			vim.keymap.set("n", "gD", "<cmd>Lspsaga goto_definition<cr>", opts)
			vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", opts)
			vim.keymap.set("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
			vim.keymap.set("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
			vim.keymap.set("n", "gA", "<cmd>Lspsaga code_action<cr>", opts)
			vim.keymap.set("n", "go", "<cmd>Lspsaga outline<cr>", opts)
		end)

		lsp.setup()
	end,
}
