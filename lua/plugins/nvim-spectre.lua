return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>Rf", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
    { "<leader>Rw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "Search current word" },
    { "<leader>Rw", "<esc><cmd>lua require('spectre').open_visual()<CR>", desc = "Search current word", mode = "v" },
    { "<leader>Rp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc = "Search on current file", mode = "v" },
  }
}
