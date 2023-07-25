return {
	"tpope/vim-rails",
  event = "VeryLazy",
  keys = {
    { "<leader>aa", "<cmd>:A<cr>", desc = "Rails alternate file" },
    { "<leader>av", "<cmd>:AV<cr>", desc = "Rails alternate file in vsplit" },
    { "<leader>as", "<cmd>:AS<cr>", desc = "Rails alternate file in hsplit" },

    -- Related file
    { "<leader>ar", "<cmd>:R<cr>", desc = "Rails related file" },
    { "<leader>al", "<cmd>:RV<cr>", desc = "Rails related file in vsplit" },
    { "<leader>aj", "<cmd>:RS<cr>", desc = "Rails related file in hsplit" },
  }
}
