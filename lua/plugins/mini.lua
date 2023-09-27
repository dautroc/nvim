return {
  "echasnovski/mini.nvim",
  keys = {
    { "<leader>e", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>", desc = "Mini file current" },
    { "gS", "<CMD>lua MiniSplitjoin.toggle()<CR>", desc = "Mini split join" },
    { "<leader>mt", "<CMD>lua MiniTrailspace.trim()<CR>", desc = "Mini Trim" },
  },
  event = "BufRead",
  version = false,
  config = function()
    require("mini.trailspace").setup()
    require("mini.splitjoin").setup()
    require("mini.files").setup({
      mappings = {
        close = "q",
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "H",
        reset = "<BS>",
        show_help = "g?",
        synchronize = "w",
        trim_left = "<",
        trim_right = ">",
      },
    })
  end,
}
