return {
	"nvim-neotest/neotest",
  keys = {
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%')) <cr>", desc = "Test file" },
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Test nearest" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Stop" },
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Attach" },
  },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-rspec"),
			},
		})
	end,
}
