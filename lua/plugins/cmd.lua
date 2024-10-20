-- Command Editing: Edit your cmdline like a normal buffer.
-- Commandline features : Keep almost all the cmdline features (no block mode).
-- Command Line History Navigation: Navigate through previously entered commands with ease like in the cmdwindow (hitting j and k).

return {
  "smilhey/ed-cmd.nvim",
  config = function()
    require("ed-cmd").setup({
      -- Those are the default options, you can just call setup({}) if you don't want to change the defaults
      cmdline = { keymaps = { edit = "jk", execute = "<CR>" } },
      -- You enter normal mode in the cmdline with edit and execute a command from normal mode with execute
      pumenu = { max_items = 100 },
    })
  end,
}
