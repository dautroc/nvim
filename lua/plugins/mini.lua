return {
  "echasnovski/mini.nvim",
  keys = {
    { "gS", "<CMD>lua MiniSplitjoin.toggle()<CR>", desc = "Mini split join" },
    { "<leader>mt", "<CMD>lua MiniTrailspace.trim()<CR>", desc = "Mini Trim" },
  },
  event = "BufRead",
  version = false,
  config = function()
    require("mini.trailspace").setup()
    require("mini.diff").setup({
      mappings = {
        apply = '',
        reset = '',
        textobject = '',
        goto_first = '[H',
        goto_prev = '[h',
        goto_next = ']h',
        goto_last = ']H',
      },
    })
    -- require("mini.statusline").setup()
    require("mini.splitjoin").setup()
    -- require("mini.notify").setup()
    require('mini.indentscope').setup()
    require('mini.icons').setup()
  end,
}
