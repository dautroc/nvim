local function local_llm_streaming_handler(chunk, line, assistant_output, bufnr, winid, F)
	if not chunk then
		return assistant_output
	end
	local tail = chunk:sub(-1, -1)
	if tail:sub(1, 1) ~= "}" then
		line = line .. chunk
	else
		line = line .. chunk
		local status, data = pcall(vim.fn.json_decode, line)
		if not status or not data.message.content then
			return assistant_output
		end
		assistant_output = assistant_output .. data.message.content
		F.WriteContent(bufnr, winid, data.message.content)
		line = ""
	end
	return assistant_output
end

local function local_llm_parse_handler(chunk)
	local assistant_output = chunk.message.content
	return assistant_output
end

return {
	"Kurama622/llm.nvim",
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
	cmd = { "LLMSessionToggle", "LLMSelectedTextHandler" },
	config = function()
		local tools = require("llm.common.tools")
		require("llm").setup({
			prompt = "You are a helpful AI assistant.",

			prefix = {
				user = { text = "😃 ", hl = "Title" },
				assistant = { text = "⚡ ", hl = "Added" },
			},

			-- Local llm
			url = "http://localhost:11434/api/chat",
			model = "deepseek-r1",
			api_type = "ollama",

			-- Opts
			-- max_tokens = 1024,
			-- save_session = true,
			-- max_history = 15,
			-- history_path = "/tmp/history",
			-- temperature = 0.3,
			-- top_p = 0.7,

			spinner = {
				text = {
					"󰧞󰧞",
					"󰧞󰧞",
					"󰧞󰧞",
					"󰧞󰧞",
				},
				hl = "Title",
			},

			display = {
				diff = {
					layout = "vertical", -- vertical|horizontal split for default provider
					opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
					provider = "default", -- default|mini_diff
				},
			},

    -- stylua: ignore
    keys = {
      -- The keyboard mapping for the input window.
      ["Input:Cancel"]      = { mode = "n", key = "<C-c>" },
      ["Input:Submit"]      = { mode = "n", key = "<cr>" },
      ["Input:Resend"]      = { mode = "n", key = "<C-r>" },

      -- only works when "save_session = true"
      ["Input:HistoryNext"] = { mode = "n", key = "<C-j>" },
      ["Input:HistoryPrev"] = { mode = "n", key = "<C-k>" },

      -- The keyboard mapping for the output window in "split" style.
      ["Output:Ask"]        = { mode = "n", key = "i" },
      ["Output:Cancel"]     = { mode = "n", key = "<C-c>" },
      ["Output:Resend"]     = { mode = "n", key = "<C-r>" },

      -- The keyboard mapping for the output and input windows in "float" style.
      ["Session:Toggle"]    = { mode = "n", key = "<leader>hc" },
      ["Session:Close"]     = { mode = "n", key = "<esc>" },
    },

			app_handler = {
				CommitMsg = {
					handler = tools.flexi_handler,
					prompt = function()
						return string.format(
							[[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:
                1. Start with an action verb (e.g., feat, fix, refactor, chore, etc.), followed by a colon.
                2. Briefly mention the file or module name that was changed.
                3. Describe the specific changes made.

                Examples:
                - feat: update common/util.py, added test cases for util.py
                - fix: resolve bug in user/auth.py related to login validation
                - refactor: optimize database queries in models/query.py

                Based on this format, generate appropriate commit messages. Respond with message only. DO NOT format the message in Markdown code blocks, DO NOT use backticks:

                ```diff
                %s
                ```
              ]],
							vim.fn.system("git diff --no-ext-diff --staged")
						)
					end,
					opts = {
						enter_flexible_window = true,
						apply_visual_selection = false,
					},
				},
			},

			-- Handler config for local LLM
			streaming_handler = local_llm_streaming_handler,
		})
	end,
	keys = {
		{ "<leader>hc", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "Local LLM chat" },
	},
}
