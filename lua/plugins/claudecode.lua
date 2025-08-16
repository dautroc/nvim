return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	config = function()
		require("claude-code").setup({
			window = {
				position = "vertical",
			},
		})
	end,
	keys = {
		{ "<leader>C", "<cmd>ClaudeCode<CR>", desc = "Open Claude Code" },
	},
}
