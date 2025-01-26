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
				local_deepseek = function()
					return require("codecompanion.adapters").extend("ollama", {
						name = "local_deepseek",
						schema = {
							model = {
								default = "deepseek-r1:latest",
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
				custom_copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						name = "custom_copilot",
						schema = {
							model = {
								default = "claude-3.5-sonnet",
							},
						},
					})
				end,
			},
			strategies = {
				chat = { adapter = "copilot" },
				inline = { adapter = "copilot" },
				agent = { adapter = "copilot" },
			},
			display = {
				chat = {
					intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
					show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
					separator = "─", -- The separator between the different messages in the chat buffer
					show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
					show_settings = true, -- Show LLM settings at the top of the chat buffer?
					show_token_count = true, -- Show the token count for each response?
					start_in_insert_mode = false, -- Open the chat buffer in insert mode?
				},
			},
		})
	end,
}
