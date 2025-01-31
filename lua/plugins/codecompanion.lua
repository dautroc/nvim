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
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						schema = {
							model = {
								default = "deepseek-r1:latest",
							},
						},
					})
				end,

				copilot = function()
					return require("codecompanion.adapters").extend("copilot", {
						schema = {
							model = {
								default = "claude-3.5-sonnet",
							},
						},
					})
				end,
			},
			strategies = {
				-- chat = { adapter = "copilot" },
				-- inline = { adapter = "copilot" },
				-- agent = { adapter = "copilot" },
				chat = { adapter = "ollama" },
				inline = { adapter = "ollama" },
				agent = { adapter = "ollama" },
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
					diff = {
						enabled = true,
						close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
						layout = "vertical", -- vertical|horizontal split for default provider
						opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
						provider = "mini_diff", -- default|mini_diff
					},
				},
			},
			-- prompt_library = {
			-- 	["Docusaurus"] = {
			-- 		strategy = "chat",
			-- 		description = "Write documentation for me",
			-- 		opts = {
			-- 			index = 11,
			-- 			is_slash_cmd = false,
			-- 			auto_submit = false,
			-- 			short_name = "docs",
			-- 		},
			-- 		references = {
			-- 			{
			-- 				type = "file",
			-- 				path = {
			-- 					"doc/.vitepress/config.mjs",
			-- 					"lua/codecompanion/config.lua",
			-- 					"README.md",
			-- 				},
			-- 			},
			-- 		},
			-- 		prompts = {
			-- 			{
			-- 				role = "user",
			-- 				content = [[I'm rewriting the documentation for my plugin CodeCompanion.nvim, as I'm moving to a vitepress website. Can you help me rewrite it?
			--                    I'm sharing my vitepress config file so you have the context of how the documentation website is structured in the `sidebar` section of that file.cu
			--                    I'm also sharing my `config.lua` file which I'm mapping to the `configuration` section of the sidebar.
			--                  ]],
			-- 			},
			-- 		},
			-- 	},
			-- },
		})
	end,
}
