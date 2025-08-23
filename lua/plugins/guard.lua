return {
	"nvimdev/guard.nvim",
	enabled = false,
	dependencies = {
		"nvimdev/guard-collection",
	},
	keys = {
		{ "<leader>lf", "<cmd>Guard fmt<cr>", desc = "Format" },
		{ "<leader>lg", "<cmd>Guard info<cr>", desc = "Guard Info" },
	},
	config = function()
		local ft = require("guard.filetype")
		-- use stylua to format lua files and no linter
		ft("lua"):fmt("lsp"):append("stylua"):lint("luacheck")
		ft("json"):fmt("prettier")

		-- use lsp to format first then use rubocop format
		ft("ruby"):fmt("lsp"):append("rubocop"):lint("rubocop")
		-- ft("typescriptreact"):fmt("lsp"):append("prettier"):lint("eslint_d")
		-- ft("go"):fmt("lsp"):append("gofumt"):lint("golangci-lint")
		ft("python"):fmt("lsp"):append("black"):lint("flake8")

		vim.g.guard_config = {
			fmt_on_save = false,
			lsp_as_default_formatter = true,
		}
	end,
}
