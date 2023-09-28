return {
  "nvim-neotest/neotest",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec"
  },
	keys = {
		{ "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = "Test file" },
		{ "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", desc = "Test nearest" },
		{ "<leader>ta", "<cmd>lua require('neotest').run.attach()<cr>", desc = "Test attach" },
		{ "<leader>to", "<cmd>Neotest output-panel<cr>", desc = "Test output" },
		{ "<leader>tl", "<cmd>Neotest run last<cr>", desc = "Test last" },
		{ "<leader>ts", "<cmd>Neotest summary<cr>", desc = "Test summary" },
		{ "<leader>tx", "<cmd>require('neotest').run.stop()<cr>", desc = "Test stop" },
	},
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-rspec")
      },
    })
  end
}
