return {
	"olimorris/codecompanion.nvim",
	wadependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{ "<leader>jj", "<CMD>CodeCompanion<CR>", desc = "Code Companion" },
		{ "<leader>jc", "<CMD>CodeCompanionChat<CR>", desc = "Code Companion Chat" },
		{ "<leader>jd", ":CodeCompanionCmd ", desc = "Code Companion Cmd" },
		{ "<leader>ja", "<CMD>CodeCompanionActions<CR>", desc = "Code Companion Actions", mode = { "n", "x" } },
	},
	config = function()
		require("codecompanion.adapters").extend("ollama", {
			schema = {
				model = {
					default = "deepseek-r1:latest",
				},
				num_ctx = {
					default = 131072,
				},
				num_predict = {
					default = -1,
				},
			},
		})

		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "ollama",
				},
				inline = {
					adapter = "ollama",
				},
			},
		})
	end,
}
