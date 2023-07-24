return {
	"nvimdev/guard.nvim",
	keys = {
		{ "gq", "<cmd>GuardFmt<cr>", "Guard format" },
	},
	config = function()
		local ft = require("guard.filetype")
		-- use stylua to format lua files and no linter
		ft("lua"):fmt("stylua")

		-- use lsp to format first then use rubocop format
		ft("ruby"):fmt("lsp"):append("rubocop"):lint("rubocop")

		require("guard").setup()
	end,
}
