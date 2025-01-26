return {
	"olimorris/codecompanion.nvim",
	wadependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>jc", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Code Companion Chat" },
		{ "<leader>jg", ":CodeCompanionCmd ", desc = "Generate command" },

		-- Visual
		{ "<leader>jj", ":CodeCompanion", desc = "Code Companion", mode = { "v" } },
		{ "<leader>ja", "<CMD>CodeCompanionActions<CR>", desc = "Code Companion Actions", mode = { "n", "v" } },
		{ "<leader>js", "<CMD>CodeCompanionChat Add<CR>", desc = "Add selection to chat", mode = { "v" } },
	},
	config = function()
		require("codecompanion").setup({
			adapters = {
				deepseek_coder = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "deepseek_coder",
						schema = {
							model = {
								default = "deepseek-coder-v2:latest",
							},
						},
						num_ctx = {
							default = 16384,
						},
						num_predict = {
							default = -1,
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "deepseek_coder" },
				inline = { adapter = "deepseek_coder" },
				agent = { adapter = "deepseek_coder" },
			},
		})
	end,
}
