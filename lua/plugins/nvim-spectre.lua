return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>Ff", "<cmd>lua require('spectre').toggle()<CR>", desc = "Toggle Spectre" },
    { "<leader>Fw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", desc = "Search current word" },
    { "<leader>Fw", "<esc><cmd>lua require('spectre').open_visual()<CR>", desc = "Search current word", mode = "v" },
    { "<leader>Fp", "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", desc = "Search on current file", mode = "v" },
  }
}
