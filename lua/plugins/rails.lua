return {
	"tpope/vim-rails",
  event = "VeryLazy",
  keys = {
    { "<leader>aa", "<cmd>:A<cr>", desc = "Open alternate file" },
    { "<leader>av", "<cmd>:AV<cr>", desc = "Open alternate file in vsplit" },
    { "<leader>as", "<cmd>:AS<cr>", desc = "Open alternate file in hsplit" },

    -- Related file
    { "<leader>ar", "<cmd>:R<cr>", desc = "Open related file" },
  }
}
