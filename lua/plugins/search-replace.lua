return {
  "roobert/search-replace.nvim",
  keys = {
    { "<leader>ffo", "<cmd>SearchReplaceSingleBufferOpen<CR>", desc = "Open" },
    { "<leader>ffw", "<cmd>SearchReplaceSingleBufferCWord<CR>", desc = "CWord" },
    { "<C-r>", "<cmd>SearchReplaceSingleBufferVisualSelection<CR>", desc = "Visual Selection", mode = "v" },
  },
  config = function()
    require("search-replace").setup({
      -- optionally override defaults
      default_replace_single_buffer_options = "gcI",
      default_replace_multi_buffer_options = "egcI",
    })
  end,
}
