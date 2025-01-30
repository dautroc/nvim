return {
	"Kurama622/llm.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
	cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
	config = function()
		local tools = require("llm.common.tools")
		require("llm").setup({
      -- Ollama
      -- url = "http://localhost:11434/api/chat",
      -- model = "deepseek-r1:latest",
      -- api_type = "ollama",

      -- Github
      url = "https://models.inference.ai.azure.com/chat/completions",
      model = "gpt-4o",
      api_type = "openai",

      -- App handler
			app_handler = {
				OptimizeCode = {
					handler = tools.side_by_side_handler,
					-- opts = {
					--   streaming_handler = local_llm_streaming_handler,
					-- },
				},
				TestCode = {
					handler = tools.side_by_side_handler,
					prompt = [[ Write some test cases for the following code, only return the test cases.
            Give the code content directly, do not use code blocks or other tags to wrap it. ]],
					opts = {
						right = {
							title = " Test Cases ",
						},
					},
				},
				OptimCompare = {
					handler = tools.action_handler,
				},
				CodeExplain = {
					handler = tools.flexi_handler,
					prompt = "Explain the following code",
					opts = {
						enter_flexible_window = true,
					},
				},
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
		})
	end,
	keys = {
		{ "<leader>kc", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "Toggle session" },
		{ "<leader>ke", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>", desc = "Code explain" },
		{ "<leader>kc", mode = "x", "<cmd>LLMAppHandler TestCode<cr>", desc = "Test code" },
		{ "<leader>ko", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>", desc = "Optimize compare" },
		{ "<leader>kg", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>", desc = "Commit message" },
		-- { "<leader>ko", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>", desc = "Optimize code" },
	},
}
