return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.register({
      b = { name = "+buffer/bookmark" },
      d = { name = "+devdocs" },
      c = { name = "+qfixlist" },
      f = {
        name = "+find",
        f = "+find and replace",
      },
      r = {
        name = "+rails",
      },
      g = { name = "+git" },
      a = { name = "+alternative" },
      m = {
        name = "+misc",
        u = { name = "+utils" },
      },
      t = { name = "+test" },
      l = { name = "+layout" },
      o = {
        name = "+obsidian",
      },
      n = {
        name = "+neorg",
        i = {
          name = "+insert",
        },
        f = {
          name = "+find",
        },
      },
      }, { prefix = "<leader>" })
  end,
}
