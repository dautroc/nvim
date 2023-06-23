return {
	"nvim-neotest/neotest",
  keys = {
    { "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%')) <cr>", desc = "Run current file" },
    { "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", desc = "Run last" },
    { "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Run nearest" },
    { "<leader>ts", "<cmd>lua require('neotest').run.stop()<cr>", desc = "Run stop" },
    { "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Run attach" },

    -- Summary & Output
    { "<leader>tt", "<cmd>lua require('neotest').summary.toggle()<cr>", desc = "Summary" },
    { "<leader>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>", desc = "Output" },
    { "<leader>tp", "<cmd>lua require('neotest').output_panel.toggle()<cr>", desc = "Output pannel" },
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
