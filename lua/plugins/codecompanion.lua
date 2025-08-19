local supported_adapters = require("plugins.codecompanion.adapters").supported_adapters

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"j-hui/fidget.nvim",
	},
	keys = {
		{ "<A-i>", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Toggle Chat" },
		-- { "<leader>jj", "<CMD>CodeCompanionChat Toggle<CR>", desc = "Toggle Chat" },
		{
			"<leader>jj",
			function()
				vim.cmd("CodeCompanionChat Toggle")
				vim.cmd("wincmd =")
			end,
			desc = "Toggle Chat",
		},
		{ "<leader>jl", "<CMD>CodeCompanionLoad<CR>", desc = "Load saved chat" },
		{
			"<leader>jg",
			function()
				Snacks.input.input({ prompt = "Enter generate command prompt" }, function(value)
					if value == nil then
						return
					end
					vim.cmd("CodeCompanionCmd " .. value)
				end)
			end,
			desc = "Generate command",
		},
		{
			"<leader>js",
			"<CMD>CodeCompanionSave<CR>",
			desc = "Save chat",
		},

		-- Visual
		{
			"<leader>jj",
			function()
				Snacks.input.input({ prompt = "Ask with selected code" }, function(value)
					if value == nil then
						return
					end
					vim.cmd("CodeCompanion /buffer " .. value)
				end)
			end,
			desc = "Ask with selected code",
			mode = { "v" },
		},
		{ "<leader>je", "<CMD>CodeCompanion /explain<CR>", desc = "Explain selected code", mode = { "v" } },
		{ "<leader>ja", "<CMD>CodeCompanionActions<CR>", desc = "Code Companion Actions", mode = { "n", "v" } },
		{ "<leader>js", "<CMD>CodeCompanionChat Add<CR>", desc = "Add selection to chat", mode = { "v" } },
	},
	config = function()
		require("codecompanion").setup({
			language = "English",
			adapters = supported_adapters,
			strategies = {
				chat = {
					adapter = "copilot",
					roles = {
						user = "Sophia Laura",
						llm = function(adapter)
							return adapter.formatted_name .. " (" .. adapter.schema.model.default .. ")"
						end,
					},
					slash_commands = {
						["buffer"] = { opts = { provider = "snacks" } },
						["file"] = { opts = { provider = "snacks" } },
						["help"] = { opts = { provider = "snacks" } },
						["symbols"] = { opts = { provider = "snacks" } },
					},
				},
				inline = { adapter = "copilot" },
				agent = { adapter = "copilot" },
			},
			display = {
				action_palette = { provider = "telescope" },
				chat = {
					intro_message = "Press ? for options",
					show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
					separator = "─", -- The separator between the different messages in the chat buffer
					show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
					show_settings = false, -- Show LLM settings at the top of the chat buffer?
					show_token_count = true, -- Show the token count for each response?
					start_in_insert_mode = false, -- Open the chat buffer in insert mode?
					icons = {
						pinned_buffer = " ",
						watched_buffer = "👀 ",
					},
					diff = {
						enabled = true,
						close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
						layout = "vertical", -- vertical|horizontal split for default provider
						opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
						provider = "default", -- default|mini_diff
					},
				},
			},
		})
	end,
	init = function()
		require("plugins.codecompanion.fidget-spinner"):init()
		require("plugins.codecompanion.chat-history"):init()
	end,
}
