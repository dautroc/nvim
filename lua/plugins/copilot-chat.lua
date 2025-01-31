return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log wrapper
		},
		branch = "main",
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			highlight_headers = true,
			separator = "",
			question_header = "#   You:",
			answer_header = "#   Copilot:",
			error_header = "> [!ERROR] Error",
			model = "claude-3.5-sonnet", -- GPT model to use, 'gpt-3.5-turbo', 'gpt-4', or 'gpt-4o', 'claude-3.5-sonnet'
			debug = false, -- Enable debugging
			prompts = {
				ReviewCode = {
					prompt = "/COPILOT_REVIEW Please review the following code and provide suggestions for improvement.",
				},
				BetterNamings = {
					prompt = "Please provide better names for the following variables and functions.",
				},
				SwaggerApiDocs = {
					prompt = "Please provide documentation for the following API using Swagger.",
				},
				SwaggerJsDocs = {
					prompt = "Please write JSDoc for the following API using Swagger.",
				},
				TextWording = {
					prompt = "Please improve the grammar and wording of the following text.",
				},
				TextConcise = {
					prompt = "Please rewrite the following text to make it more concise.",
				},
			},
			mappings = {
				reset = {
					normal = "<C-r>",
					insert = "<C-r>",
				},
			},
		},
		keys = {
			{
				"<leader>ho",
				function()
					require("CopilotChat").open()
				end,
				desc = "Open chat",
			},
			{
				"<leader>hp",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "Prompt actions",
			},
			{
				"<leader>hs",
				function()
					local input = vim.fn.input("Perplexity: ")
					if input ~= "" then
						require("CopilotChat").ask(input, {
							agent = "perplexityai",
							selection = false,
						})
					end
				end,
				desc = "Perplexity Search",
				mode = { "n", "v" },
			},
			{
				"<leader>hm",
				"<cmd>CopilotChatModels<CR>",
				desc = "Copilot models",
			},
		},
	},
}
