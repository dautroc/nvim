return {
  "backdround/improved-search.nvim",
  keys = {
    { "n", "<CMD>lua require('improved-search').stable_next()<CR>" },
    { "N", "<CMD>lua require('improved-search').stable_previous()<CR>" },
    { "!", "<CMD>lua require('improved-search').current_word()<CR>" },

    { "!", "<CMD>lua require('improved-search').in_place()<CR>", mode = "v" },
    { "*", "<CMD>lua require('improved-search').forward()<CR>", mode = "v" },
    { "#", "<CMD>lua require('improved-search').backward()<CR>", mode = "v" },
  },
}
